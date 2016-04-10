package edu.umn.laccore.tmi

class Artifact {
	String name
	String description
	String artifactType
	String artifactImage // core image - image filename in components/artifact
	String annotationImage // annotated/overlay core image - filename in components/artifact
	
	static constraints = {
		name(blank:false)
		description(blank:false)
		artifactType(blank:false)
		artifactImage(blank:false, unique:true)
		annotationImage(blank:false, unique:true)
	}
	
	String toString() { "${name}" }
}
