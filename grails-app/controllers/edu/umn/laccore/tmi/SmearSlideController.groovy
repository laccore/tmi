package edu.umn.laccore.tmi

class SmearSlideController {
	def sedClassService
	
	static scaffold = true
	
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

	// generate sedclass name from current SmearSlideComponents	
	def sedclass() {
		def curSmearSlide = SmearSlide.get(params.id)
		if (!curSmearSlide)
			curSmearSlide = new SmearSlide(params)
		else
			curSmearSlide.properties = params
		
		def _toBeRemoved = curSmearSlide.components.findAll {it?.deleted || (it == null) || it.percentage <= 0}
		
		// if there are components to be deleted
		if (_toBeRemoved) {
			curSmearSlide.components.removeAll(_toBeRemoved)
		}
		
		curSmearSlide.discard()
		def sedclassName = sedClassService.sedimentName(curSmearSlide.grainSize, curSmearSlide.components)
		
		render "${sedclassName}"
	}
}
