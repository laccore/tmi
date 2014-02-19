package edu.umn.laccore.tmi

class TagEditor {

    static constraints = {
		oldTag nullable:false,blank:false
		newTag nullable:false,blank:false
		imagesUpdated nullable:true
		componentsUpdated nullable:true
    }
	
	String oldTag = ""
	String newTag = ""
	Integer imagesUpdated = 0
	Integer componentsUpdated = 0
	Date dateCreated
	Date lastUpdated
	static hasMany = [affectedImages:Image,affectedComponents:UniqueIdentification]
}
