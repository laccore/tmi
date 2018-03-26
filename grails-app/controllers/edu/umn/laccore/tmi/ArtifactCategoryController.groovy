package edu.umn.laccore.tmi

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN', 'IS_AUTHENTICATED_FULLY'])
class ArtifactCategoryController {
	def utilsService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [artifactCategoryInstanceList: ArtifactCategory.list(params), artifactCategoryInstanceTotal: ArtifactCategory.count()]
    }

    def create = {
        def artifactCategoryInstance = new ArtifactCategory()
        artifactCategoryInstance.properties = params
        return [artifactCategoryInstance: artifactCategoryInstance]
    }

    def save() {
        def artifactCategoryInstance = new ArtifactCategory(params)
        if (!updateImage(request, artifactCategoryInstance) || !artifactCategoryInstance.save(flush: true)) {
            render(view: "create", model: [artifactCategoryInstance: artifactCategoryInstance])
			return
        }
		
		flash.message = "${message(code: 'default.created.message', args: [message(code: 'artifactCategory.label', default: 'ArtifactCategory'), artifactCategoryInstance.id])}"
		redirect(action: "show", id: artifactCategoryInstance.id)
    }

    def show = {
        def artifactCategoryInstance = ArtifactCategory.get(params.id)
        if (!artifactCategoryInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'artifactCategory.label', default: 'ArtifactCategory'), params.id])}"
            redirect(action: "list")
        }
        else {
            [artifactCategoryInstance: artifactCategoryInstance]
        }
    }

    def edit = {
        def artifactCategoryInstance = ArtifactCategory.get(params.id)
        if (!artifactCategoryInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'artifactCategory.label', default: 'ArtifactCategory'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [artifactCategoryInstance: artifactCategoryInstance]
        }
    }

    def update = {
        def artifactCategoryInstance = ArtifactCategory.get(params.id)
        if (artifactCategoryInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (artifactCategoryInstance.version > version) {
                    
                    artifactCategoryInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'artifactCategory.label', default: 'ArtifactCategory')] as Object[], "Another user has updated this ArtifactCategory while you were editing")
                    render(view: "edit", model: [artifactCategoryInstance: artifactCategoryInstance])
                    return
                }
            }
            artifactCategoryInstance.properties = params
            if (!artifactCategoryInstance.hasErrors() && updateImage(request, artifactCategoryInstance) && artifactCategoryInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'artifactCategory.label', default: 'ArtifactCategory'), artifactCategoryInstance.id])}"
                redirect(action: "show", id: artifactCategoryInstance.id)
            }
            else {
                render(view: "edit", model: [artifactCategoryInstance: artifactCategoryInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'artifactCategory.label', default: 'ArtifactCategory'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def artifactCategoryInstance = ArtifactCategory.get(params.id)
        if (artifactCategoryInstance) {
            try {
                artifactCategoryInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'artifactCategory.label', default: 'ArtifactCategory'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'artifactCategory.label', default: 'ArtifactCategory'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'artifactCategory.label', default: 'ArtifactCategory'), params.id])}"
            redirect(action: "list")
        }
    }
	
	// handle uploaded category image file
	def updateImage = { requestObj, artifactCategoryInstance ->
		def uploadedFile = requestObj.getFile("categoryImagePayload")
		if (!uploadedFile.empty) {
			if (!utilsService.isAllowedImageFile(uploadedFile.originalFilename))
			{
				flash.message = "Filetype extension not in permitted list - ${utilsService.getAllowedExtensions()}"
				return false
			}
			// save and process image
			def filename = uploadedFile.originalFilename.replace(' ', '_')
			uploadedFile.transferTo(new File(utilsService.getArtifactImagesDir(), filename))
			artifactCategoryInstance.categoryImage = filename
		}
		return true
	}
}
