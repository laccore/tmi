package edu.umn.laccore.tmi

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN', 'IS_AUTHENTICATED_FULLY'])
class UniqueIdentificationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [uniqueIdentificationInstanceList: UniqueIdentification.list(params), uniqueIdentificationInstanceTotal: UniqueIdentification.count()]
    }

    def create = {
        def uniqueIdentificationInstance = new UniqueIdentification()
        uniqueIdentificationInstance.properties = params
        return [uniqueIdentificationInstance: uniqueIdentificationInstance]
    }

    def save = {
        def uniqueIdentificationInstance = new UniqueIdentification(params)
        if (uniqueIdentificationInstance.save(flush: true)) {
			if (uniqueIdentificationInstance.uiTags) uniqueIdentificationInstance.parseTags(uniqueIdentificationInstance.uiTags, " ")
			if (uniqueIdentificationInstance.distinguishingFeatures) uniqueIdentificationInstance.parseTags(uniqueIdentificationInstance.distinguishingFeatures, "\n")
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'uniqueIdentification.label', default: 'UniqueIdentification'), uniqueIdentificationInstance.id])}"
            redirect(action: "show", id: uniqueIdentificationInstance.id)
        }
        else {
            render(view: "create", model: [uniqueIdentificationInstance: uniqueIdentificationInstance])
        }
    }

	@Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
	def show = {
        def uniqueIdentificationInstance = UniqueIdentification.get(params.id)
        if (!uniqueIdentificationInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'uniqueIdentification.label', default: 'UniqueIdentification'), params.id])}"
            redirect(action: "list")
        }
        else {
            [uniqueIdentificationInstance: uniqueIdentificationInstance]
        }
    }

    def edit = {
        def uniqueIdentificationInstance = UniqueIdentification.get(params.id)
        if (!uniqueIdentificationInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'uniqueIdentification.label', default: 'UniqueIdentification'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [uniqueIdentificationInstance: uniqueIdentificationInstance]
        }
    }

    def update = {
        def uniqueIdentificationInstance = UniqueIdentification.get(params.id)
        if (uniqueIdentificationInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (uniqueIdentificationInstance.version > version) {
                    
                    uniqueIdentificationInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'uniqueIdentification.label', default: 'UniqueIdentification')] as Object[], "Another user has updated this UniqueIdentification while you were editing")
                    render(view: "edit", model: [uniqueIdentificationInstance: uniqueIdentificationInstance])
                    return
                }
            }
            uniqueIdentificationInstance.properties = params
			
			if (uniqueIdentificationInstance.uiTags) uniqueIdentificationInstance.parseTags(uniqueIdentificationInstance.uiTags, " ")
			if (uniqueIdentificationInstance.distinguishingFeatures) uniqueIdentificationInstance.parseTags(uniqueIdentificationInstance.distinguishingFeatures, "\n")
            if (!uniqueIdentificationInstance.hasErrors() && uniqueIdentificationInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'uniqueIdentification.label', default: 'UniqueIdentification'), uniqueIdentificationInstance.id])}"
                redirect(action: "show", id: uniqueIdentificationInstance.id)
            }
            else {
                render(view: "edit", model: [uniqueIdentificationInstance: uniqueIdentificationInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'uniqueIdentification.label', default: 'UniqueIdentification'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def uniqueIdentificationInstance = UniqueIdentification.get(params.id)
        if (uniqueIdentificationInstance) {
            try {
                uniqueIdentificationInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'uniqueIdentification.label', default: 'UniqueIdentification'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'uniqueIdentification.label', default: 'UniqueIdentification'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'uniqueIdentification.label', default: 'UniqueIdentification'), params.id])}"
            redirect(action: "list")
        }
    }
	
}
