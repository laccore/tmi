package edu.umn.laccore.tmi

class LightType {

    static constraints = {
		name()
		abbr(maxSize:2)
    }
	
	static mapping = {
		sort "name"
	}
	
	String name
	String abbr
	
	String toString() {
		"${name}"
	}
}
