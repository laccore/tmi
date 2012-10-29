package edu.umn.laccore.tmi

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN', 'IS_AUTHENTICATED_FULLY'])
class IdentificationTypeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [identificationTypeInstanceList: IdentificationType.list(params), identificationTypeInstanceTotal: IdentificationType.count()]
    }

    def create = {
        def identificationTypeInstance = new IdentificationType()
        identificationTypeInstance.properties = params
        return [identificationTypeInstance: identificationTypeInstance]
    }

    def save = {
        def identificationTypeInstance = new IdentificationType(params)
        if (identificationTypeInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'identificationType.label', default: 'IdentificationType'), identificationTypeInstance.id])}"
            redirect(action: "show", id: identificationTypeInstance.id)
        }
        else {
            render(view: "create", model: [identificationTypeInstance: identificationTypeInstance])
        }
    }

    def show = {
        def identificationTypeInstance = IdentificationType.get(params.id)
        if (!identificationTypeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'identificationType.label', default: 'IdentificationType'), params.id])}"
            redirect(action: "list")
        }
        else {
            [identificationTypeInstance: identificationTypeInstance]
        }
    }

    def edit = {
        def identificationTypeInstance = IdentificationType.get(params.id)
        if (!identificationTypeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'identificationType.label', default: 'IdentificationType'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [identificationTypeInstance: identificationTypeInstance]
        }
    }

    def update = {
        def identificationTypeInstance = IdentificationType.get(params.id)
        if (identificationTypeInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (identificationTypeInstance.version > version) {
                    
                    identificationTypeInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'identificationType.label', default: 'IdentificationType')] as Object[], "Another user has updated this IdentificationType while you were editing")
                    render(view: "edit", model: [identificationTypeInstance: identificationTypeInstance])
                    return
                }
            }
            identificationTypeInstance.properties = params
            if (!identificationTypeInstance.hasErrors() && identificationTypeInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'identificationType.label', default: 'IdentificationType'), identificationTypeInstance.id])}"
                redirect(action: "show", id: identificationTypeInstance.id)
            }
            else {
                render(view: "edit", model: [identificationTypeInstance: identificationTypeInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'identificationType.label', default: 'IdentificationType'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def identificationTypeInstance = IdentificationType.get(params.id)
        if (identificationTypeInstance) {
            try {
                identificationTypeInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'identificationType.label', default: 'IdentificationType'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'identificationType.label', default: 'IdentificationType'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'identificationType.label', default: 'IdentificationType'), params.id])}"
            redirect(action: "list")
        }
    }
}
