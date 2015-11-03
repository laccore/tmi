package edu.umn.laccore.tmi

class SmearSlide {
	String name				// user-provided slide name
	String expedition
	String lakeYear
	String siteHole
	String driveTool
	String section
	String sedclassName		// sediment name (major modifier + principal component)
	String grainSize		// (sandy | silty | clayey) + (sand | silt | clay)
	String reason			// reason for taking slide...redundant (name/comments field could be used for this)?
	String comments			// comments
	float depth				// depth where sample was taken
	List components = new ArrayList()
	User user

	static hasMany = [components:SmearSlideComponent]
	
	static mapping = {
		// when we remove items from this.components, they become orphaned - delete them automatically
		components cascade: "all-delete-orphan"
	}
	
	static constraints = {
		name(blank:false, nullable:false)
		expedition()
		lakeYear()
		siteHole()
		driveTool()
		section()
		depth()
		reason()
		components()
		user(blank:false, nullable:false)
		sedclassName(blank:false, nullable:false)
		grainSize(blank:false, nullable:false)
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
