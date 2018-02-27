package edu.umn.laccore.tmi

import org.grails.taggable.*

class Artifact implements Taggable {
	String name
	String description
	String uiTags
	String artifactImage // core image - image filename in components/artifact
	String annotationImage // annotated/overlay core image - filename in components/artifact
	
	static constraints = {
		name(blank:false)
		description(blank:false, maxSize:4096)
		uiTags(blank:true, nullable:true)
		artifactImage(blank:false, unique:true)
		annotationImage(blank:false, unique:true)
	}
	
	String toString() { "${name}" }
}
