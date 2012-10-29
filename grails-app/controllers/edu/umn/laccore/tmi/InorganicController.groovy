package edu.umn.laccore.tmi

class InorganicController {

    //static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	private def allInorganics() {
		def inorganics = UniqueIdentification.withCriteria {
			createAlias("identificationType", "idt")
			eq("idt.supertype", "Inorganic")
			order("name", "asc")
		}
		return inorganics
	}

    def index = {
        redirect(action: "all", params: params)
    }
	
	def all = {
		def inorganics = allInorganics()
		render(view:'list',
			model:[uniqueIdentificationInstanceList: inorganics, uniqueIdentificationInstanceTotal: inorganics.size()])	
	}
	
	def gallery = {
		def inorganics = allInorganics()
		render(view:'gallery',
			model:[uniqueIdentificationInstanceList: inorganics, uniqueIdentificationInstanceTotal: inorganics.size()])
	}

    def list = {
		def c = UniqueIdentification.createCriteria()
		def results = c.list {
			like("name", params.id+"%")
			createAlias("identificationType", "idt")
			eq("idt.supertype", "Inorganic")
			//'in'("identificationType",[IdentificationType.findByName("Mineral"), IdentificationType.findByName("Mineraloid")])
			//eq("identificationType.supertype","Inorganic")
		}
        [uniqueIdentificationInstanceList: results, uniqueIdentificationInstanceTotal: results.size()]
    }
	
	def lithofacies = {
		def c = UniqueIdentification.createCriteria()
		def results = c.list {
			createAlias("identificationType", "idt")
			//eq("idt.supertype", "Inorganic")
			eq("idt.name","Lithofacies")
		}
		render(view:"list", model:[uniqueIdentificationInstanceList: results, uniqueIdentificationInstanceTotal: results.size()])
	}
	
	def contaminant = {
		def c = UniqueIdentification.createCriteria()
		def results = c.list {
			createAlias("identificationType", "idt")
			//eq("idt.supertype", "Inorganic")
			eq("idt.name","Contaminant")
		}
		render(view:"list", model:[uniqueIdentificationInstanceList: results, uniqueIdentificationInstanceTotal: results.size()])
	}

    
}
