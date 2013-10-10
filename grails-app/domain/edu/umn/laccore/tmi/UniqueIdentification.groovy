package edu.umn.laccore.tmi

import org.grails.taggable.*

class UniqueIdentification extends Node implements Taggable {

    static constraints = {
		identificationType(nullable:true)
		name(blank:false)
		description(blank:true, nullable:true, maxSize:4096)
		distinguishingFeatures(blank:true, nullable:true, maxSize:512)
		uiTags(blank:true, nullable:true)
    }
	
	static searchable = true
	
	static hasMany = [images:Image, imposters:Imposter, externalResources:ExternalResource]
	
	//static belongsTo = [identificationType:IdentificationType]
	
	static mapping = {
		sort "name"
	}
	
	static deprecatedTagMap = {
		//use taggableService.getTagCounts('domainClassType') instead from a taggableSerive injected into a controller. 
		//e.g. see quickstart controller and view for use
		def ts = new TaggableService()
		def defaultMap = ['':0]
		def tagMap = ts.getTagCounts('uniqueIdentification')
		return (tagMap.isEmpty())?defaultMap:tagMap
		//uses
		//tripInstance.parseTags(tripInstance.tagText, " ") in controller save() and update() methods
		//<tags:tagCloud action="show" tags="${Trip.tagMap() }"/> in GSP, e.g., list.gsp
	}
	
	String name
	String description
	String distinguishingFeatures
	IdentificationType identificationType
	String uiTags
	
	
	
	String className() {
		"Mineral"
	}
	
	String toString() {
		"${name}"
	}
	
	String noWhitespace() {
		name.replaceAll(" ", "")
	}
	
	List imagesInDisplayOrder() {
		def sortByTaxon = false
		if (identificationType.name == "Plant")
			if (this.name == "Pollen" || this.name == "Plant Macrofossil")
				sortByTaxon = true
				
		def c = Image.createCriteria()
		def images = c.list {
			eq('uniqueIdentification.id',id)
			and { gt('displayOrder',0) }
			sortByTaxon ? order("taxon","asc") : order("displayOrder","asc")
		}
		return images
	}
	
	String imagesDir() {
		//Image.componentImagesDir + File.separatorChar + uniqueIdentification?.identificationType?.noWhitespace()+ File.separatorChar + uniqueIdentification?.noWhitespace()
		identificationType?.noWhitespace()+ File.separatorChar + this.noWhitespace()
	}
	
}
