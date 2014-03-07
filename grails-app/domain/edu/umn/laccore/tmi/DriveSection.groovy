package edu.umn.laccore.tmi

class DriveSection {

    static constraints = {
    }
	
	User user
	String driveSection
	static hasMany = [smearSlides:SmearSlide]
}
