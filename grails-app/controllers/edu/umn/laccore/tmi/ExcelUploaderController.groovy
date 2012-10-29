package edu.umn.laccore.tmi

import grails.plugins.springsecurity.Secured
import org.grails.plugins.excelimport.ExcelImportService
import org.grails.plugins.excelimport.ExpectedPropertyType
import org.apache.poi.hssf.usermodel.HSSFWorkbook
import org.apache.poi.poifs.filesystem.POIFSFileSystem
import org.apache.poi.xssf.usermodel.XSSFWorkbook

@Secured(['ROLE_ADMIN', 'IS_AUTHENTICATED_FULLY'])
class ExcelUploaderController {

	def searchableService 
	
	static scaffold = false
	

	static Map CONFIG_BOOK_COLUMN_MAP = [
		sheet:'Sheet1',
		startRow: 1,
		columnMap:  [
				'A':'name',
				'B':'uniqueIdentification',
				'C':'identificationType',
				'D':'lightType',
				'E':'lakeName',
				'F':'expeditionCode',
				'G':'lakeCode',
				'H':'year',
				'I':'siteHole',
				'J':'drive',
				'K':'corerType',
				'L':'section',
				'M':'depth',
				'N':'originalImageName',
				'O':'uiTags',
				'P':'submittedBy',
				'Q':'notes',
				'R':'image',
				'S':'magnification',
				'T':'taxon'
		]
	]
	
	static Map PROPERTY_CONFIGURATION_MAP = [
		year:([expectedType: ExpectedPropertyType.StringType, defaultValue:null]),
		drive:([expectedType: ExpectedPropertyType.StringType, defaultValue:null]),
		tool:([expectedType: ExpectedPropertyType.StringType, defaultValue:null]),
		section:([expectedType: ExpectedPropertyType.StringType, defaultValue:null]),
		depth:([expectedType: ExpectedPropertyType.StringType, defaultValue:null]),
		taxon:([expectedType: ExpectedPropertyType.StringType, defaultValue:null])
	]
	
	//Reading images from a workbook:
	
	 
/*		List lst = workbook.getAllPictures()
		for (Iterator it = lst.iterator(); it.hasNext(); ) {
			PictureData pict = (PictureData)it.next();
			String ext = pict.suggestFileExtension();
			byte[] data = pict.getData();
			if (ext.equals("jpeg")){
			  FileOutputStream out = new FileOutputStream("pict.jpg");
			  out.write(data)
			  out.close()
			}
		}
*/		 

	def index = {
		render(view:'upload')
	}
	
	def upload = {
		searchableService.stopMirroring()
		def file = request.getFile('file')
		//def fs = new POIFSFileSystem(file.getInputStream())
		def workbook = new XSSFWorkbook(file.getInputStream())
		List imageParamsList = ExcelImportService.columns(workbook, CONFIG_BOOK_COLUMN_MAP, null, PROPERTY_CONFIGURATION_MAP)
		
		imageParamsList.each { Map imageParamMap ->
			//replace strings with persistent objects where possible
			def newUI = null
			imageParamMap.each { k,v->
				println k+":"+v
				if (k=="uniqueIdentification") {
					def ui = UniqueIdentification.findByName(v)	//returns null if not found
					println "XXX " + ui
					if (ui) imageParamMap[k] = ui
				}
				if (k=="corerType" && v!=null) {
					imageParamMap[k] = CorerType.findByCorerShort(v)
				}
				if (k=="lightType") {
					imageParamMap[k] = LightType.findByAbbr(v)
				}
			}
			
			// This won't work!
			//def book = new Book(title: 'The Shining')
			//book.save()
			//author.addToBooks(book)
			
			// Do it this way instead. 
			//def book = new Book(title: 'Misery') 
			//author.addToBooks(book) 
			//author.save()
			
			//Two paths to follow:
			//1) if persisent UI was found - simply fluff up an Image from the map and save
			//2) if UI was not found - use string map to assign new UI instance to newUI, remove UI from map, instantiate new Image using map, call UI.addToImages(image), save newUI
			if ( !(imageParamMap['uniqueIdentification'] instanceof UniqueIdentification) ) {
				def unknownComponent = imageParamMap['uniqueIdentification'].capitalize()
				println "unknown: " + unknownComponent
				newUI = new UniqueIdentification(name:unknownComponent,identificationType:IdentificationType.findByName(imageParamMap['identificationType'].capitalize()))
				imageParamMap.remove('uniqueIdentification')
				def imageInstance = new Image (imageParamMap)
				imageInstance.displayOrder = 10  //force a display order value otherwise image does not show on UI.show view
				//imageInstance.save(flush:true)
				//println imageInstance
				newUI.addToImages(imageInstance)
				if (newUI.save(flush:true)) {
					flashHelper.info(imageInstance.name + " added to new UniqueIdentification instance " + unknownComponent)
				} else {
					flashHelper.error(imageInstance.name + " not added - previously unknown component, " +unknownComponent + ", might not have been added either" )
					newUI.errors.each { e ->
						flashHelper.error(" " + e )
					}
					println "UI+Image not saved, errors = ${newUI.errors}"
				}
				if (imageInstance.uiTags) imageInstance.parseTags(imageInstance.uiTags, " ")
			} else {
				//create new image using column map
				def imageInstance = new Image (imageParamMap)
				imageInstance.displayOrder = 10
				if (imageInstance.save(flush: true)) {
					if (imageInstance.uiTags) imageInstance.parseTags(imageInstance.uiTags, " ")
					flashHelper.info(imageInstance.name + " added")
				} else {
					flashHelper.error("<br/>" + imageInstance.name + " not added" )
					imageInstance.errors.each { e ->
						flashHelper.error(" " + e )
					}
					println "Image not saved, errors = ${imageInstance.errors}"
				}
			}
			
			
			
			//if ( !(imageInstance.save()) ) {
			//	println "Image not saved, errors = ${imageInstance.errors}"
			//}
			
			//image tags should be image specific, not component specific
			//e.g., each feldspar image could be tagged with 'cleavage' but this overstates the tag count
			//cleavage is really a property of feldspar, not the specific image
			//image-specific attributes should be tagged - like 'resorbed' or anything that is not also common to the mineral
			//that is, any property displayed in the image, but not normally used to ID the component
		}
		render(view: "upload")
	}
		
}

/*
 //multiple file upload
 <g:form action="save" method="post" enctype="multipart/form-data" >  

   <input type='file' name='documentFile.1' />  
   <input type='file' name='documentFile.2' />  
   <input type='file' name='documentFile.3' />  
   </g:form>  

In your controller

def files = []  
params.documentFile.each {  
  files.add(it.value)  
 }  

//multiple messages skeleton
def statuses = []
items.each {
  //...
  statuses << "Success"
}
flash.itemStatuses = statuses

....

<g:if test="flash.itemStatuses">
  <ul>
    <g:each in="flash.itemStatuses"><li>${it}</li></g:each>
  </ul>
</g:if>
*/