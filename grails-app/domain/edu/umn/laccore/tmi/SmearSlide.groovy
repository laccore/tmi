package edu.umn.laccore.tmi

class SmearSlide {
	String name				// user-provided slide name
	String sedimentName		// sediment name (major modifier + principal component)
	String grainSize		// (sandy | silty | clayey) + (sand | silt | clay)
	String reason			// reason for taking slide...redundant (name field could be used for this)?
	String comments			// comments
	String coreSection		// core section containing sample from which slide was made 
	float depth				// depth where sample was taken

	static hasMany = [components:SmearSlideComponent]
	
	static constraints = {
		name(blank:false, nullable:false)
		sedimentName(blank:false, nullable:false)
	}
}
