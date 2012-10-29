package edu.umn.laccore.tmi

class Imposter {

    static constraints = {
		uniqueIdentification()
		imposter()
		description(maxSize:2048)
		
    }
	
	static belongsTo = [uniqueIdentification:UniqueIdentification]
	
	UniqueIdentification imposter
	String description
	
	String toString() {
		"${imposter}"
	}
}
