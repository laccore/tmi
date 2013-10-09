package edu.umn.laccore.tmi

class SedClassService {

    // String grainSize - silty clay, clayey sand, sandy silt, etc.
	// components - list of SmearSlideComponents (for now) 
	def sedimentName = { grainSize, components -> 
		// count all buckets
		def abundances = [:]
		components.each() {
			// for abundance counting purposes, fine and coarse organics are considered the
			// same type - only need to consider them individually if organics are the
			// primary component type so we can choose peat or sapropel correctly.
			def countType = it.component.isOrganic() ? SedimentComponent.SedimentType.OF : it.component.type
				
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
		def primComps = components.findAll() { it.component.type == primTypeEntry.key }
		primComps.sort() { -it.percentage }
		
		def secComps = components.findAll() { it.component.type == secTypeEntry?.key }
		secComps.sort() { -it.percentage }

		// if primary type is siliciclastics, use grainSize as primary name
		def primaryName = null
		switch (primTypeEntry.key)
		{
			case SedimentComponent.SedimentType.C: // carbonates
				primaryName = "carbonate (" + (primComps[0].component.name) + ") mud"
				break
			case SedimentComponent.SedimentType.S: // siliciclastics
				primaryName = grainSize
				break
			case SedimentComponent.SedimentType.M: // microfossils
				primaryName = primComps[0].component.name
				break
			case SedimentComponent.SedimentType.OF: // catch-all for *both* organic types
				def fine = 0, coarse = 0
				components.each() {
					if (it.component.isOrganic())
						if (it.component.type == SedimentComponent.SedimentType.OF)
							fine += it.percentage
						else // ORGANIC_COARSE
							coarse += it.percentage
				}
				primaryName = (fine > coarse) ? "sapropel" : "peat"
				break
			case SedimentComponent.SedimentType.O: // other
				primaryName = primComps[0].component.name
				break
		}
		
		// if secondary type is siliciclastics, pull only noun portion of grainSize (if two words)
		// and convert to adjective.
		def secName = ""
		if (secTypeEntry != null)
		{
			println "secTypeEntry key = " + secTypeEntry.key
			switch (secTypeEntry.key)
			{
				case SedimentComponent.SedimentType.C:
					secName = "calcareous (" + secComps[0].component.name + ")"
					break
				case SedimentComponent.SedimentType.S:
					secName = makeSecondaryGrainSize(grainSize)
					break
				case SedimentComponent.SedimentType.M:
					secName = secComps[0].component.modifier
					break
				case SedimentComponent.SedimentType.OF:
				case SedimentComponent.SedimentType.OC:
					secName = "organic-rich"
					break
				case SedimentComponent.SedimentType.O:
					secName = secComps[0].component.modifier
					break
			}
		}
		
		def sedclassName = secName + " " + primaryName
		println "Sediment Name: " + sedclassName
		sedclassName
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