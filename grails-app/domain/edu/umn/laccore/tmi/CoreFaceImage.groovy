package edu.umn.laccore.tmi

class CoreFaceImage {
	String name
	String description
	String coreFaceImage // image filename in components/coreface - brgtodo 3/4/2014 rename to imageFile (or something other than the class name)
	
	static hasMany = [annotations:CoreFaceAnnotation]

	static constraints = {
		name(blank:false, maxSize:50)
		description(blank:false, maxSize:1024)
		coreFaceImage(blank:false, unique:true)
    }
	
	String toString() { "${name}" }
}
