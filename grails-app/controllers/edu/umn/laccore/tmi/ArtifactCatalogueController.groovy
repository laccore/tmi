package edu.umn.laccore.tmi

class ArtifactCatalogueController {
	def utilsService
	
    def index = {
		render(view:"artifactCatalogue", model: [artifactList: Artifact.list(), artifactCategoryList: ArtifactCategory.list(sort:"displayOrder")])
	}
}
