package edu.umn.laccore.tmi

class IdentificationType {

    static constraints = {
		supertype(inList:["Inorganic","Organic"],blank:false)
		name(maxSize:128)
		label(nullable:true)
    }
	
	static mapping = {
		sort "name"
	}
	
	String name
	String supertype
	String label
	
	String toString() {
		"${name}"
	}
	
	String noWhitespace() {
		name.replaceAll(" ", "").toLowerCase()
	}
}
