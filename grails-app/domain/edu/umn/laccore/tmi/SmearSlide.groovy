package edu.umn.laccore.tmi

class SmearSlide {
	String name				// user-provided slide name
	String sedclassName		// sediment name (major modifier + principal component)
	String grainSize		// (sandy | silty | clayey) + (sand | silt | clay)
	String reason			// reason for taking slide...redundant (name/comments field could be used for this)?
	String comments			// comments
	String coreSection		// core section containing sample from which slide was made 
	float depth				// depth where sample was taken
	List components = new ArrayList()

	static hasMany = [components:SmearSlideComponent]
	static belongsTo = [driveSection:DriveSection]
	
	static mapping = {
		// when we remove items from this.components, they become orphaned - delete them automatically
		components cascade: "all-delete-orphan"
	}
	
	static constraints = {
		name(blank:false, nullable:false)
		driveSection()
		coreSection()
		depth()
		reason()
		grainSize(blank:false, nullable:false)
		components()
		sedclassName(blank:false, nullable:false)
		comments()
	}
	
	// list components in descending order
	def componentList() { new ArrayList(components).sort {a,b -> b.percentage.compareTo(a.percentage)} }
	def totalPercentage() {
		def sum = 0
		components.each { sum += it.percentage }
		return sum
	}
}
