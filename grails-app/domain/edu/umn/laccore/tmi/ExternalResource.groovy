package edu.umn.laccore.tmi

class ExternalResource {

    static constraints = {
		name(maxSize:128)
		URL(url:true)
    }
	
	static belongsTo = [uniqueIdentification:UniqueIdentification]
	
	String name
	String URL
	
	String toString() {
		"${name}"
	}
}
