package edu.umn.laccore.tmi

import org.springframework.web.multipart.MultipartFile
import org.grails.taggable.*

class Image implements Taggable {

	static searchable = true
	
	static componentPathPrefix = "components/"
	
	static constraints = {
		name(blank:false, unique:true)
		uniqueIdentification(nullable:false)
		lightType(nullable:true, blank:true)
		expeditionCode(nullable:true, blank:true)
		lakeName(nullable:true, blank:true)
		lakeCode(nullable:true, blank:true)
		year(size:4..4,nullable:true, blank:true)
		siteHole(nullable:true, blank:true)
		drive(nullable:true, blank:true)
		corerType(nullable:true)
		section(nullable:true, blank:true)
		depth(nullable:true, blank:true)
		notes(blank:true, maxSize:1024,nullable:true)
		submittedBy(blank:true, nullable:true)
		displayOrder(blank:true, nullable:true)
		filename(blank:true, nullable:true)
		filenameMedium(blank:true, nullable:true)
		filenameThumb(blank:true, nullable:true)
		uiTags(blank:true, nullable:true)
		originalImageName(blank:true,nullable:true)
		magnification(blank:true,nullable:true)
		taxon(blank:true,nullable:true)
		
	}

	//static belongsTo = [uniqueIdentification:UniqueIdentification, lightType:LightType, corerType:CorerType]
	static belongsTo = [uniqueIdentification:UniqueIdentification]
	
	static chooseSome = {
		Image.executeQuery('from Image order by rand()', [max: 12])
	}
	
	String name
	Integer displayOrder
	String expeditionCode
	String lakeName
	String lakeCode
	String year
	String siteHole
	String drive
	String section
	String depth
	String notes
	String submittedBy
	String filename
	String filenameMedium
	String filenameThumb
	LightType lightType
	CorerType corerType
	String uiTags
	String originalImageName
	String magnification
	String taxon
	
	String toString() {
		"${name}"
	}
	
	String imagesDir() {
		//Image.componentImagesDir + File.separatorChar + uniqueIdentification?.identificationType?.noWhitespace()+ File.separatorChar + uniqueIdentification?.noWhitespace()
		uniqueIdentification?.identificationType?.noWhitespace()+ File.separatorChar + uniqueIdentification?.noWhitespace()
	}
	
	String viewDir() {
		Image.componentPathPrefix + uniqueIdentification?.identificationType?.noWhitespace()+ File.separatorChar + uniqueIdentification?.noWhitespace()
	}

}