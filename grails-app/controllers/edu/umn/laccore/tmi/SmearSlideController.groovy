package edu.umn.laccore.tmi

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_USER', 'IS_AUTHENTICATED_FULLY'])
class SmearSlideController {
	
	def sedClassService
	def springSecurityService
	def exportService
	def grailsApplication  //inject GrailsApplication
	
	static scaffold = true
	
	def create = {
		def smearSlideInstance = new SmearSlide()
		smearSlideInstance.properties = params
		smearSlideInstance.user = springSecurityService.currentUser
		return [smearSlideInstance: smearSlideInstance]
	}
	
	def list = {
		def user = springSecurityService.currentUser
		def roles = springSecurityService.getPrincipal().getAuthorities().collect { it.toString() }
		println user.getClass().getName()
		def list
		def admin = false
		if ( roles.contains("ROLE_ADMIN") ) {
			admin = true
		}
		params.max = Math.min(params.max ? params.int('max') : 20, 100)
		list = admin ? SmearSlide.list(params) : SmearSlide.findAllByUser(user,params)	
		//export plugin
		
		if(params?.format && params.format != "html"){
			if(!params.max) params.max = 10
			response.contentType = grailsApplication.config.grails.mime.types[params.format]
			response.setHeader("Content-disposition", "attachment; filename=smear_slides_${springSecurityService.currentUser.username}.${params.extension}")
			//println list
			exportService.export(params.format, response.outputStream, list, [:], [:])
		}
		
		[smearSlideInstanceList: list, smearSlideInstanceTotal: list.size()]
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
