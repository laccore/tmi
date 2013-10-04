package edu.umn.laccore.tmi

class SedClassService {

    // String grainSize - silty clay, clayey sand, sandy silt, etc.
	// components - list of SmearSlideComponents (for now) 
	def sedimentName = { grainSize, components -> 
		// count all buckets
		def abundances = [:]
		components.each() {
			// for abundance counting purposes, ORGANIC_FINE and ORGANIC_COARSE are the
			// same type - only need to consider them individually if the combined ORGANICs
			// are the primary component type so we can choose peat or sapropel correctly.
			def countType = it.isOrganic() ? SmearSlideComponent.ORGANIC_FINE : it.type
				
			if (abundances[countType] == null)
				abundances[countType] = it.percentage
			else
				abundances[countType] += it.percentage
			println it.toString()
		}
		
		// find two most abundant types
		def primTypeEntry = abundances.max() { it.value }
		abundances.remove(primTypeEntry.key)
		def secTypeEntry = abundances.max() { it.value }
		
		// rank components of each of the two most abundant component types
		def primComps = components.findAll() { it.type == primTypeEntry.key }
		primComps.sort() { -it.percentage }
		
		def secComps = components.findAll() { it.type == secTypeEntry.key }
		secComps.sort() { -it.percentage }

		// if primary type is siliciclastics, use grainSize as primary name
		def primaryName = null
		switch (primTypeEntry.key)
		{
			case SmearSlideComponent.CARBONATE:
				primaryName = "carbonate (" + (primComps[0].name) + ") mud"
				break
			case SmearSlideComponent.SILICICLASTICS:
				primaryName = grainSize
				break
			case SmearSlideComponent.MICROFOSSILS:
				primaryName = primComps[0].name
				break
			case SmearSlideComponent.ORGANIC_FINE: // catch-all for both organic types, thus no ORGANIC_COARSE case
				def fine = 0, coarse = 0
				components.each() {
					if (it.isOrganic())
						if (it.type == SmearSlideComponent.ORGANIC_FINE)
							fine += it.percentage
						else // ORGANIC_COARSE
							coarse += it.percentage
				}
				primaryName = (fine > coarse) ? "sapropel" : "peat"
				break
			case SmearSlideComponent.OTHER:
				primaryName = primComps[0].name
				break
		}
		
		// if secondary type is siliciclastics, pull only noun portion of grainSize (if two words)
		// and convert to adjective.
		def secName = null
		println "secTypeEntry key = " + secTypeEntry.key
		switch (secTypeEntry.key)
		{
			case SmearSlideComponent.CARBONATE:
				secName = "calcareous (" + secComps[0].name + ")"
				break
			case SmearSlideComponent.SILICICLASTICS:
				secName = makeSecondaryGrainSize(grainSize)
				break
			case SmearSlideComponent.MICROFOSSILS:
				secName = secComps[0].modifier
				break
			case SmearSlideComponent.ORGANIC_FINE:
			case SmearSlideComponent.ORGANIC_COARSE:
				secName = "organic-rich"
				break
			case SmearSlideComponent.OTHER:
				secName = secComps[0].modifier
				break
		}
		
		println "Sediment Name: " + secName + " " + primaryName
    }
	
	// return modified grain size appropriate for use as a modifier in sediment class name, i.e.
	// pulling grain size modifier (silty/clayey/sandy) if present and turning noun into an adjective
	def makeSecondaryGrainSize = { grainSize ->
		def result = null
		def words = grainSize?.split(' ')
		if (words.length == 2)
		{
			result = adjectifyGrainMap[words[1]]
		}
		else if (words.length == 1)
		{
			result = adjectifyGrainMap[words[0]]
		}
		else // something is wrong
			println "0 or 2+ words in provided grain size [${grainSize}], what the?"
		
		result
	}
	
	def adjectifyGrainMap = ['sand':'sandy', 'silt':'silty', 'clay':'clayey'] 	
}