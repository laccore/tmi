package edu.umn.laccore.tmi

class ArtifactCatalogueController {
    def index = {
		def arts = Artifact.list()
		
		// determine unique types - better way to do this?
		def uniqueTypes = []
		arts.each { uniqueTypes << it.artifactType }
		uniqueTypes = uniqueTypes as Set
		
		// create map where key = type, value = lists of all Artifacts of that type
		def	typedArtifactMap = [:]
		uniqueTypes.each { type ->
			typedArtifactMap[type] = Artifact.findAllByArtifactType(type)
		}
		
		render(view:"artifactCatalogue", model: [typedArtifactMap: typedArtifactMap])
	}
}
