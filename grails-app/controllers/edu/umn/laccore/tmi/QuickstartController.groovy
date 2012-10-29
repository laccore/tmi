package edu.umn.laccore.tmi

//import org.grails.taggable.*

class QuickstartController {

    //static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def taggableService

    def index = {
		render(view:"quickstart",model:[taggableService:taggableService])
    }

    
}
