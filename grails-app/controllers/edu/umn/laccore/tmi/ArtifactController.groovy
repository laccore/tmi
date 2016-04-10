package edu.umn.laccore.tmi

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN', 'IS_AUTHENTICATED_FULLY'])
class ArtifactController {
	def utilsService
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def index = {
		redirect(action: 'list', params: params)
	}
	
	def list = {
		render(view: 'list', model: [artifactInstanceList: Artifact.list()])
	}

    def list(Integer max) {
        [artifactInstanceList: Artifact.list(params), artifactInstanceTotal: Artifact.count()]
    }

    def create() {
        [artifactInstance: new Artifact(params)]
    }
	
	def save() {
        def artifactInstance = new Artifact(params)
		println "save: ${artifactInstance.properties}"
		
        if (!updateArtifactImages(request, artifactInstance) || !artifactInstance.save(flush: true)) {
            render(view: "create", model: [artifactInstance: artifactInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'artifact.label', default: 'Artifact'), artifactInstance.id])
        redirect(action: "show", id: artifactInstance.id)
    }

    def show(Long id) {
        def artifactInstance = Artifact.get(id)
        if (!artifactInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'artifact.label', default: 'Artifact'), id])
            redirect(action: "list")
            return
        }

        [artifactInstance: artifactInstance]
    }

    def edit(Long id) {
        def artifactInstance = Artifact.get(id)
        if (!artifactInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'artifact.label', default: 'Artifact'), id])
            redirect(action: "list")
            return
        }

        [artifactInstance: artifactInstance]
    }

    def update(Long id, Long version) {
        def artifactInstance = Artifact.get(id)
        if (!artifactInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'artifact.label', default: 'Artifact'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (artifactInstance.version > version) {
                artifactInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'artifact.label', default: 'Artifact')] as Object[],
                          "Another user has updated this Artifact while you were editing")
                render(view: "edit", model: [artifactInstance: artifactInstance])
                return
            }
        }

        artifactInstance.properties = params
        if (!updateArtifactImages(request, artifactInstance) || !artifactInstance.save(flush: true)) {
            render(view: "edit", model: [artifactInstance: artifactInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'artifact.label', default: 'Artifact'), artifactInstance.id])
        redirect(action: "show", id: artifactInstance.id)
    }

    def delete(Long id) {
        def artifactInstance = Artifact.get(id)
        if (!artifactInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'artifact.label', default: 'Artifact'), id])
            redirect(action: "list")
            return
        }

        try {
            artifactInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'artifact.label', default: 'Artifact'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'artifact.label', default: 'Artifact'), id])
            redirect(action: "show", id: id)
        }
    }
	
	// handle uploaded image file
	def updateImage = { requestObj, artifactInstance, imageType ->
		def uploadedFile = requestObj.getFile(imageType + "Payload")
		if (!uploadedFile.empty) {
			if (!utilsService.isAllowedImageFile(uploadedFile.originalFilename))
			{
				flash.message = "Filetype extension not in permitted list - ${utilsService.getAllowedExtensions()}"
				return false
			}
			// save and process image
			def filename = uploadedFile.originalFilename.replace(' ', '_')
			uploadedFile.transferTo(new File(utilsService.getArtifactImagesDir(), filename))
			artifactInstance."$imageType" = filename
		}
		return true
	}
	
	def updateArtifactImages = { requestObj, artInst ->
		return updateImage(requestObj, artInst, "artifactImage") && updateImage(requestObj, artInst, "annotationImage")
	}
}
