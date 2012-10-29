package edu.umn.laccore.tmi

class OrganicController {

    //static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def allOrganics() {
		def results = UniqueIdentification.withCriteria {
			createAlias("identificationType", "idt")
			eq("idt.supertype", "Organic")
			order("name", "asc")
		}
		return results
    }
	
	def index = {
        redirect(action: "all", params: params)
    }
	
	def all = {
		def results = allOrganics()
		render(view:"list", model:[uniqueIdentificationInstanceList: results, uniqueIdentificationInstanceTotal: results.size()])
	}
	
	def gallery = {
		def results = allOrganics()
		render(view:"gallery", model:[uniqueIdentificationInstanceList: results, uniqueIdentificationInstanceTotal: results.size()])
	}
	
	/*def algae = {
		//log.error "Executing action $actionName"
        forward(action:"list", params:[origAction:"$actionName"])
    }
	def arthropod = {
		forward(action:"list", params:[origAction:"$actionName"])
	}
	def fish = {
		forward(action:"list", params:[origAction:"$actionName"])
	}
	def invertebrate = {
		forward(action:"list", params:[origAction:"$actionName"])
	}
	def zooplankton = {
		forward(action:"list", params:[origAction:"$actionName"])
	}
	def plantRemains = {
		forward(action:"list", params:[origAction:"Other plant remain"])
	}
	def microorganisms = {
		forward(action:"list", params:[origAction:"Microorganism"])
	}*/

    def list = {
        //params.max = Math.min(params.max ? params.int('max') : 10, 100)
		def c = UniqueIdentification.createCriteria()
		def results = c.list {
			eq("identificationType", IdentificationType.findByName("$params.id".capitalize()))
			order("name", "asc")
		}
        [uniqueIdentificationInstanceList: results, uniqueIdentificationInstanceTotal: results.size()]
    }

    
}
