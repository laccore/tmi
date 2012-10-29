package edu.umn.laccore.tmi

import grails.plugins.springsecurity.Secured
import org.grails.plugins.excelimport.ExcelImportService
import org.grails.plugins.excelimport.ExpectedPropertyType
import org.apache.poi.hssf.usermodel.HSSFWorkbook
import org.apache.poi.poifs.filesystem.POIFSFileSystem
import org.apache.poi.xssf.usermodel.XSSFWorkbook

@Secured(['ROLE_ADMIN', 'IS_AUTHENTICATED_FULLY'])
class ExcelUploaderService {

	static scaffold = false
	static transactional = true

	static Map CONFIG_BOOK_COLUMN_MAP = [
		sheet:'Sheet1',
		startRow: 1,
		columnMap:  [
				'A':'name',
				'B':'uniqueIdentification',
				'C':'identificationType',
				'D':'lightType',
				'E':'location (lake name)',
				'F':'expeditionCode',
				'G':'lakeCode',
				'H':'year',
				'I':'siteHole',
				'J':'drive',
				'K':'corerType',
				'K':'section',
				'M':'depth',
				'N':'original image file name',
				'O':'uiTags',
				'P':'submittedBy',
				'Q':'notes',
				'R':'image'
		]
	]
	
	static Map PROPERTY_CONFIGURATION_MAP = [
		year:([expectedType: ExpectedPropertyType.StringType, defaultValue:null]),
		drive:([expectedType: ExpectedPropertyType.StringType, defaultValue:null]),
		tool:([expectedType: ExpectedPropertyType.StringType, defaultValue:null]),
		section:([expectedType: ExpectedPropertyType.StringType, defaultValue:null]),
		depth:([expectedType: ExpectedPropertyType.StringType, defaultValue:null])
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
		def file = request.getFile('file')
		//def fs = new POIFSFileSystem(file.getInputStream())
		def workbook = new XSSFWorkbook(file.getInputStream())
		//def hasErrors = false
		
		List imageParamsList = ExcelImportService.columns(workbook, CONFIG_BOOK_COLUMN_MAP, null, PROPERTY_CONFIGURATION_MAP)
		
		imageParamsList.each { Map imageParamMap ->
			imageParamMap.each { k,v->
				println k+":"+v
				if (k=="uniqueIdentification") {
					imageParamMap[k] = UniqueIdentification.findByName(v)
				}
				if (k=="corerType" && v!=null) {
					imageParamMap[k] = CorerType.findByCorerShort(v)
				}
				if (k=="lightType") {
					imageParamMap[k] = LightType.findByAbbr(v)
				}
			}
			//create new image using column map
			def imageInstance = new Image (imageParamMap)
			
			
			//if ( !(imageInstance.save()) ) {
			//	println "Image not saved, errors = ${imageInstance.errors}"
			//}
			if (imageInstance.save(flush: true)) {
				if (imageInstance.uiTags) imageInstance.parseTags(imageInstance.uiTags, " ")
				//flash.message = "${message(code: 'default.created.message', args: [message(code: 'image.label', default: 'Image'), imageInstance.id])}"
				flashHelper.info(imageInstance.name + " added")
				//redirect(action: "upload")
			} else {
				flashHelper.error("<br/>" + imageInstance.name + " not added" )
				imageInstance.errors.each { e ->
					flashHelper.error(" " + e )
				}
				println "Image not saved, errors = ${imageInstance.errors}"
				//render(view: "upload", model: [imageInstance: imageInstance])
			}
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