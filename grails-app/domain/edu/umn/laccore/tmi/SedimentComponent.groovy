package edu.umn.laccore.tmi

class SedimentComponent {
	public enum SedimentType {
		C("Carbonates"),
		S("Siliciclastics"),
		M("Microfossils"),
		OF("Organic matter, fine"),
		OC("Organic matter, coarse"),
		O("Other")
		
		static list() { [C,S,M,OF,OC,O] }
		
		final String value;
		SedimentType(String value) { this.value = value; }
		String getKey() { name() }
		String toString() { value }
	}
	
	String name						// noun form (principal name)
	String modifier 				// adjective form (major modifier)
	SedimentType type
	String speechToTextMappings		// list of "misheard" strings for this component, e.g. "Vivian Knight" for "vivianite"
	boolean isStandardComponent		// is component a standard, TMI-provided component (true), or user-created (false)?

	static final int CARBONATE = 0;
	static final int SILICICLASTICS = 1;
	static final int MICROFOSSILS = 2;
	static final int ORGANIC_FINE = 3;
	static final int ORGANIC_COARSE = 4;
	static final int OTHER = 5;
	
	static constraints = {
		name(blank:false, nullable:false, unique:true)
		modifier(blank:false, nullable:false)
		type(blank:false, nullable:false)
		isStandardComponent(blank:false, nullable:false)
	}

	boolean isOrganic() { return (type == ORGANIC_FINE || type == ORGANIC_COARSE) }
	String toString() {	"${name} (${type})" }
	static descendingList() { SedimentComponent.list().sort{a,b -> a.name.compareTo(b.name)} }
}
