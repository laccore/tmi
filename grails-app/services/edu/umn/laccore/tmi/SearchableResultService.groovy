package edu.umn.laccore.tmi

import org.springframework.util.ClassUtils



class SearchableResultService  {
	
	//def grailsApplication 
	
	static IMAGE = "Image"
	static UNIQUE_ID = "UniqueIdentification"
	static TAG = "Tag"
	static COMPONENT = "Component"
	
	public static isTag (classShortName) {
		(classShortName.equals(TAG)) ? true : false
	}
	
	public static isImage (classShortName) {
		(classShortName.equals(IMAGE)) ? true : false
	}
	
	public static isUniqueIdentification (classShortName) {
		(classShortName.equals(UNIQUE_ID)) ? true : false
	}
	
	public static userFacingDomainClassName(resultInstance) {
		def domainClassName = SearchableResultService.domainClassName(resultInstance)
		if (!domainClassName.equals(UNIQUE_ID)) return domainClassName
		else return COMPONENT
	}
	
	static extractDesc(resultInstance) {
		
	}
	
	static userFacingInstanceName(resultInstance) {
		def domainClassName = SearchableResultService.domainClassName(resultInstance)
		if ( domainClassName.equals(IMAGE) || domainClassName.equals(UNIQUE_ID) || domainClassName.equals(TAG) ) return resultInstance.name
		else return resultInstance.id
	}
	
	static userFacingDescription(resultInstance) {
		def domainClassName = SearchableResultService.domainClassName(resultInstance)
		if ( domainClassName.equals(IMAGE) ) return resultInstance.notes
		if ( domainClassName.equals(UNIQUE_ID) ) return resultInstance.description
		if ( domainClassName.equals(TAG) ) return "tag"
		else return "no description found"
	}
	
	private static domainClassName(resultInstance) {
		ClassUtils.getShortName(resultInstance.getClass())
	}
	
	public static domainClassNameToLower(resultInstance) {
		def domainClassName = SearchableResultService.domainClassName(resultInstance)
		domainClassName[0].toLowerCase() + domainClassName[1..-1]
		//className[0].toLowerCase() + className[1..-1]
	}
	
	public static createLink(request, resultInstance) {
		def domainClassName = SearchableResultService.domainClassName(resultInstance)
		println domainClassName
		
		if ( domainClassName.equals(UNIQUE_ID) ) {
			println 'UI found'
			return request.getContextPath() + "/uniqueIdentification/show/" + resultInstance.id
		}
		if ( domainClassName.equals(TAG) ) {
			println "tag found"
			return request.getContextPath() + "/tags/find/" + SearchableResultService.userFacingInstanceName(resultInstance)
		}
		if ( domainClassName.equals(IMAGE) ) {
			println "Image found"
			return request.getContextPath() + "/uniqueIdentification/show/" + resultInstance.uniqueIdentification.id
		}
			 
	}
}


