package edu.umn.laccore.tmi

import grails.plugins.springsecurity.Secured
import org.apache.commons.fileupload.disk.DiskFileItem
import org.apache.commons.fileupload.disk.DiskFileItemFactory
import org.apache.commons.fileupload.FileItem

@Secured(['ROLE_ADMIN', 'IS_AUTHENTICATED_FULLY'])
class QuestionController {
	def utilsService
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [questionInstanceList: Question.list(params), questionInstanceTotal: Question.count()]
    }

    def create = {
        def questionInstance = new Question()
        questionInstance.properties = params
        return [questionInstance: questionInstance]
    }

    def save = {
        def questionInstance = new Question(params)
		
		def uploadedFile = request.getFile('payload')

		if (!uploadedFile.empty) {
			if (!utilsService.isAllowedImageFile(uploadedFile.originalFilename)) {
				flash.message = "Couldn't save ${uploadedFile.originalFilename}, extension must be one of ${UtilsService.getAllowedExtensions()}"
				render(view: "create", model: [imageInstance: imageInstance])
				return
			}
		
			// save and process image
			def exampleDir = new File(utilsService.getExampleImagesDir())
			if ( !exampleDir.exists() )
				Runtime.runtime.exec("/bin/mkdir -m g+rwxs,o= " + exampleDir.path)
			def exampleFile = new File(exampleDir.path, uploadedFile.originalFilename)
			uploadedFile.transferTo(exampleFile)
			questionInstance.exampleImage = uploadedFile.originalFilename
		}
		
		
        if (questionInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'question.label', default: 'Question'), questionInstance.id])}"
            redirect(action: "show", id: questionInstance.id)
        }
        else {
            render(view: "create", model: [questionInstance: questionInstance])
        }
    }

    def show = {
        def questionInstance = Question.get(params.id)
        if (!questionInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'question.label', default: 'Question'), params.id])}"
            redirect(action: "list")
        }
        else {
            [questionInstance: questionInstance]
        }
    }

    def edit = {
        def questionInstance = Question.get(params.id)
        if (!questionInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'question.label', default: 'Question'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [questionInstance: questionInstance]
        }
    }

    def update = {
		def questionInstance = Question.get(params.id)
        if (questionInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (questionInstance.version > version) {
                    
                    questionInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'question.label', default: 'Question')] as Object[], "Another user has updated this Question while you were editing")
                    render(view: "edit", model: [questionInstance: questionInstance])
                    return
                }
            }

			def uploadedFile = request.getFile('payload')
			
			if (!uploadedFile.empty) {
				if (!utilsService.isAllowedImageFile(uploadedFile.originalFilename)) {
					flash.message = "Couldn't save ${uploadedFile.originalFilename}, extension must be one of ${UtilsService.getAllowedExtensions()}"
					render(view: "edit", model: [questionInstance: questionInstance])
					return
				}
			
				// save and process image
				def exampleDir = new File(utilsService.getExampleImagesDir())
				if ( !exampleDir.exists() )
					Runtime.runtime.exec("/bin/mkdir -m g+rwxs,o= " + exampleDir.path)
				def exampleFile = new File(exampleDir.path, uploadedFile.originalFilename)
				uploadedFile.transferTo(exampleFile)
				questionInstance.exampleImage = uploadedFile.originalFilename
			}
			
			questionInstance.properties = params
            if (!questionInstance.hasErrors() && questionInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'question.label', default: 'Question'), questionInstance.id])}"
                redirect(action: "show", id: questionInstance.id)
            }
            else {
                render(view: "edit", model: [questionInstance: questionInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'question.label', default: 'Question'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def questionInstance = Question.get(params.id)
        if (questionInstance) {
            try {
                questionInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'question.label', default: 'Question'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'question.label', default: 'Question'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'question.label', default: 'Question'), params.id])}"
            redirect(action: "list")
        }
    }
}
