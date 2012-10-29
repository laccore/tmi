package edu.umn.laccore.tmi

class Question extends Node {

    static constraints = {
		name()
		edges()
    }
	
	static hasMany = [edges:Edge]
	static mappedBy = [edges:"sourceNode"]
	
	String name
	
	String className() {
		"Question"
	}
	
	String toString() {
		"${name}"
	}

}
