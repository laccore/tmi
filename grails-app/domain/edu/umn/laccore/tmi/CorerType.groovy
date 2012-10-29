package edu.umn.laccore.tmi

class CorerType {

    static constraints = {
		name()
		corerShort(maxSize:1)
    }
	
	static mapping = {
		sort "name"
	}
	
	String name
	String corerShort
	
	String toString() {
		"${name}"
	}
}
