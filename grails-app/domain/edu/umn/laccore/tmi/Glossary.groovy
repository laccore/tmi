package edu.umn.laccore.tmi

class Glossary {

    static constraints = {
		name()
		description()
    }
	
	static mapping = {
		sort "name"
	}
	
	String name
	String description
	
	String toString() {
		"${name}"
	}
}
