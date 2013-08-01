package edu.umn.laccore.tmi

class SmearSlideComponent {
	String name						// noun form (principal name)
	String modifier 				// adjective form (major modifier)
	int percentage					// abundance of component
	boolean isStandardComponent		// is component a standard, TMI-provided component (true), or user-created (false)?
	String speechToTextMappings		// list of "misheard" strings for this component, e.g. "Vivian Knight" for "vivianite"
	
	// 7/31/2013 brgtodo(?): componentType class and field, e.g. Carbonates, Siliciclastics, Siliceous microfossils, Organic matter, Other
	// so we can compute sediment name for user-created SmearSlideComponents
	
	static belongsTo = [smearSlide:SmearSlide]
	
	static constraints = {
		name(blank:false, nullable:false)
		modifier(blank:false, nullable:false)
	}
}
