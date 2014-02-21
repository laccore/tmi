package edu.umn.laccore.tmi

//import org.grails.taggable.*

class QuickstartController {

    //static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def taggableService

    def index = {
		render(view:"quickstart",model:[taggableService:taggableService])
    }
	
	def contaminantGallery = {
		def results = UniqueIdentification.withCriteria {
			createAlias("identificationType", "idt")
			eq("idt.name", "Contaminant")
			order("name", "asc")
		}
		render(view:"gallery", model:[uniqueIdentificationInstanceList: results, uniqueIdentificationInstanceTotal: results.size()])
	}
}
