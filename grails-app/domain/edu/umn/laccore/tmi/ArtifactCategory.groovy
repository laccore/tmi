package edu.umn.laccore.tmi

// An ArtifactCategory is a collection of related tags which are used to filter
// displayed Artifacts in artifactCatalogue.gsp.
// name - category name
// description - brief description of category, to be displayed as a tooltip
// categoryTags - space-separated list of tags in this category
// categoryImage - name of image file in components/artifact dir

class ArtifactCategory {
	String name
	String description
	String categoryTags
	String categoryImage // symbol/icon for category - image filename in components/artifact dir
	Integer displayOrder // lowest will be displayed leftmost
	
    static constraints = {
		name(blank:false, nullable:false)
		description(blank:true, nullable:true, maxSize:1024)
		categoryTags(blank:true, nullable:true, maxSize:1024)
		categoryImage(blank:false, unique:true)
		displayOrder(blank:true, nullable:true)
    }
}
