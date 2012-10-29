package edu.umn.laccore.tmi

class MultipleValue extends Node {

    static constraints = {
    }
	
	static hasMany = [edges:Edge]
	static mappedBy = [edges:"sourceNode"]
	
	String name
	
	String className() {
		"Multiple Values"
	}
		
	String toString() {
		"${name}"
	}
}
