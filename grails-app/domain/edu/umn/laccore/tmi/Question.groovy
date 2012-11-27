package edu.umn.laccore.tmi

class Question extends Node {

    static constraints = {
		name()
		edges()
		exampleImage(nullable:true)
		exampleAltText(nullable:true)

    }
	
	static hasMany = [edges:Edge]
	static mappedBy = [edges:"sourceNode"]
	
	String name
	String exampleImage // filename under /images/examples
	String exampleAltText

	String className() {
		"Question"
	}
	
	String toString() {
		"${name}"
	}

}
