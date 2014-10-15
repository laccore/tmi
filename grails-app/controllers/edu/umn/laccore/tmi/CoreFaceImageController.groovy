package edu.umn.laccore.tmi

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN', 'IS_AUTHENTICATED_FULLY'])
class CoreFaceImageController {
	def utilsService
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }
	
	def coreface() {
		[coreFaceImageInstanceList: CoreFaceImage.list()]
	}

    def list(Integer max) {
        [coreFaceImageInstanceList: CoreFaceImage.list(params), coreFaceImageInstanceTotal: CoreFaceImage.count()]
    }

    def create() {
        [coreFaceImageInstance: new CoreFaceImage(params)]
    }

    // handle uploaded image file
	def updateImage = { requestObj, cfiInstance ->
		def uploadedFile = requestObj.getFile('payload')
		if (!uploadedFile.empty) {
			if (!utilsService.isAllowedImageFile(uploadedFile.originalFilename))
			{
				flash.message = "Filetype extension not in permitted list - ${utilsService.getAllowedExtensions()}"
				return false 
			}
			// save and process image
			def fixedFilename = uploadedFile.originalFilename.replace(' ', '_')
			uploadedFile.transferTo(new File(utilsService.getCoreFaceImagesDir(), fixedFilename))
			cfiInstance.coreFaceImage = fixedFilename
		}
		return true
	}
	
	def save() {
        def coreFaceImageInstance = new CoreFaceImage(params)
		
        if (!updateImage(request, coreFaceImageInstance) || !coreFaceImageInstance.save(flush: true)) {
            render(view: "create", model: [coreFaceImageInstance: coreFaceImageInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'coreFaceImage.label', default: 'CoreFaceImage'), coreFaceImageInstance.id])
        redirect(action: "show", id: coreFaceImageInstance.id)
    }

    def show(Long id) {
        def coreFaceImageInstance = CoreFaceImage.get(id)
        if (!coreFaceImageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'coreFaceImage.label', default: 'CoreFaceImage'), id])
            redirect(action: "list")
            return
        }

        [coreFaceImageInstance: coreFaceImageInstance]
    }

    def edit(Long id) {
        def coreFaceImageInstance = CoreFaceImage.get(id)
        if (!coreFaceImageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'coreFaceImage.label', default: 'CoreFaceImage'), id])
            redirect(action: "list")
            return
        }

        [coreFaceImageInstance: coreFaceImageInstance]
    }

    def update(Long id, Long version) {
        def coreFaceImageInstance = CoreFaceImage.get(id)
        if (!coreFaceImageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'coreFaceImage.label', default: 'CoreFaceImage'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (coreFaceImageInstance.version > version) {
                coreFaceImageInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'coreFaceImage.label', default: 'CoreFaceImage')] as Object[],
                          "Another user has updated this CoreFaceImage while you were editing")
                render(view: "edit", model: [coreFaceImageInstance: coreFaceImageInstance])
                return
            }
        }

        coreFaceImageInstance.properties = params
        if (!updateImage(request, coreFaceImageInstance) || !coreFaceImageInstance.save(flush: true)) {
            render(view: "edit", model: [coreFaceImageInstance: coreFaceImageInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'coreFaceImage.label', default: 'CoreFaceImage'), coreFaceImageInstance.id])
        redirect(action: "show", id: coreFaceImageInstance.id)
    }

    def delete(Long id) {
        def coreFaceImageInstance = CoreFaceImage.get(id)
        if (!coreFaceImageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'coreFaceImage.label', default: 'CoreFaceImage'), id])
            redirect(action: "list")
            return
        }

        try {
            coreFaceImageInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'coreFaceImage.label', default: 'CoreFaceImage'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'coreFaceImage.label', default: 'CoreFaceImage'), id])
            redirect(action: "show", id: id)
        }
    }
}
