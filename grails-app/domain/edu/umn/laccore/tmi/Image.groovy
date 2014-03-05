package edu.umn.laccore.tmi

import org.springframework.web.multipart.MultipartFile
import org.grails.taggable.*

class Image implements Taggable {

	static searchable = {
		spellCheck "include"
	}
	
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
		filenameOverlay(blank:true, nullable:true)
		uiTags(blank:true, nullable:true)
		originalImageName(blank:true,nullable:true)
		magnification(blank:true,nullable:true)
		taxon(blank:true,nullable:true)
		commonName(blank:true,nullable:true)
		family(blank:true,nullable:true)
	}

	//static belongsTo = [uniqueIdentification:UniqueIdentification, lightType:LightType, corerType:CorerType]
	static belongsTo = [uniqueIdentification:UniqueIdentification]
	
	static chooseSome(number = 12) {
		Image.executeQuery('from Image order by rand()', [max: number])
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
	String filenameOverlay
	LightType lightType
	CorerType corerType
	String uiTags
	String originalImageName
	String magnification
	String taxon
	String commonName
	String family
	
	String toString() {
		"${name}"
	}
	
	String toDetailedString() {
		"${this.id}: ${name} (${uniqueIdentification.name})" 
	}
	
	String tooltip() {
		String result = """Component: ${uniqueIdentification?.name}
"""
		if ( taxon?.length()>0 || family?.length()>0) {
			result += """Taxon: ${taxon?:'not specified'}
Family: ${family?:'not specified'}
"""
		}
		result += """Site name: ${lakeName?:'not specified'}
Light type: ${lightType?:'not specified'}
Magnification: ${magnification?:'not specified'}
Submitted by: ${submittedBy?:'not specified'}
Notes: ${notes?:'none'}
"""
		result
	}
	
	String imagesDir() {
		//Image.componentImagesDir + File.separatorChar + uniqueIdentification?.identificationType?.noWhitespace()+ File.separatorChar + uniqueIdentification?.noWhitespace()
		uniqueIdentification?.identificationType?.noWhitespace()+ File.separatorChar + uniqueIdentification?.noWhitespace()
	}
	
	String viewDir() {
		Image.componentPathPrefix + uniqueIdentification?.identificationType?.noWhitespace()+ File.separatorChar + uniqueIdentification?.noWhitespace()
	}

}
