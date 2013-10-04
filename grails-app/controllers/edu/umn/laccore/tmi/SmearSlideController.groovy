package edu.umn.laccore.tmi

class SmearSlideController {
	def sedClassService
	
	def index() {
		redirect(action: "list", params: params)
	}
	
	def list() {
		[ssInstanceList: SmearSlide.list()]
	}

	def show() {
		def smearSlideInstance = SmearSlide.get(params.id)
		if (!smearSlideInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'smearSlide.label', default: 'SmearSlide'), params.id])}"
			redirect(action: "list")
		}
		else {
			[smearSlideInstance: smearSlideInstance]
		}
	}
	
	
	def create() {
        [smearSlideInstance: new SmearSlide(params)]
    }
	
	def edit() {
		def smearSlideInstance = SmearSlide.get(params.id)
		if (!smearSlideInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'smearSlide.label', default: 'SmearSlide'), params.id])}"
			redirect(action: "list")
		}
		else {
			return [smearSlideInstance: smearSlideInstance]
		}
	}
	
	def save() {
		def smearSlideInstance = new SmearSlide(params)
		
		def _toBeRemoved = smearSlideInstance.components.findAll {it?.deleted || (it == null)}

		// if there are components to be deleted
		if (_toBeRemoved) {
			smearSlideInstance.components.removeAll(_toBeRemoved)
		 }
				
		if (smearSlideInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'smearSlide.label', default: 'SmearSlide'), smearSlideInstance.id])}"
			redirect(action: "show", id: smearSlideInstance.id)
		}
		else {
			render(view: "create", model: [smearSlideInstance: smearSlideInstance])
		}
	}
	
	def update() {
		def smearSlideInstance = SmearSlide.get(params.id)
		if (smearSlideInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (smearSlideInstance.version > version) {
					
					smearSlideInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'smearSlide.label', default: 'SmearSlide')] as Object[], "Another user has updated this Smear Slide while you were editing")
					render(view: "edit", model: [smearSlideInstance: smearSlideInstance])
					return
				}
			}
			smearSlideInstance.properties = params
			
			// find the phones that are marked for deletion
			def _toBeDeleted = smearSlideInstance.components.findAll {it?.deleted || !it}
			
			// if there are phones to be deleted remove them all
			if (_toBeDeleted) {
				smearSlideInstance.components.removeAll(_toBeDeleted)
			}
			
			if (!smearSlideInstance.hasErrors() && smearSlideInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'smearSlide.label', default: 'SmearSlide'), smearSlideInstance.id])}"
				redirect(action: "show", id: smearSlideInstance.id)
			}
			else {
				render(view: "edit", model: [smearSlideInstance: smearSlideInstance])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'smearSlide.label', default: 'SmearSlide'), params.id])}"
			redirect(action: "list")
		}
	}
	
	def delete() {
		def smearSlideInstance = SmearSlide.get(params.id)
		if (smearSlideInstance) {
			try {
				smearSlideInstance.delete(flush: true)
				flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'smearSlide.label', default: 'SmearSlide'), params.id])}"
				redirect(action: "list")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'smearSlide.label', default: 'SmearSlide'), params.id])}"
				redirect(action: "show", id: params.id)
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'smearSlide.label', default: 'SmearSlide'), params.id])}"
			redirect(action: "list")
		}
	}

	def makeComponents = {
		def prims = ["calcite", "aragonite", // calcite
					"quartz", "biotite", // s'tics
					"diatoms", "phytolith", // microfossils
					 "algal material", // organic fine
					 "cactus chunks", // organic coarse
					 "pyrite"] // other
		def secs = ["calcitey", "aragonitic",
					"quartzey", "biotitey",
					"diatomaceous", "phytolithic",
					"algal materially",
					"cactus chunky",
					"pyritic"]
		def types = [0, 0, 1, 1, 2, 2, 3, 4, 5]
		def percs = [15, 11, 17, 16, 5, 2, 1, 33, 2]
		def components = []
		prims.eachWithIndex() { name, index ->
			components.add(new SmearSlideComponent(name:name, modifier:secs[index], type:types[index], percentage:percs[index]))
		}
		
		components
	}
	
	def sedtest = {
		def componentList = makeComponents()
		sedClassService.sedimentName("silty sand", componentList)
	}
}
