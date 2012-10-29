package edu.umn.laccore.tmi

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN', 'IS_AUTHENTICATED_FULLY'])
class ExternalResourceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [externalResourceInstanceList: ExternalResource.list(params), externalResourceInstanceTotal: ExternalResource.count()]
    }

    def create = {
        def externalResourceInstance = new ExternalResource()
        externalResourceInstance.properties = params
        return [externalResourceInstance: externalResourceInstance]
    }

    def save = {
        def externalResourceInstance = new ExternalResource(params)
        if (externalResourceInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'externalResource.label', default: 'ExternalResource'), externalResourceInstance.id])}"
            redirect(action: "show", id: externalResourceInstance.id)
        }
        else {
            render(view: "create", model: [externalResourceInstance: externalResourceInstance])
        }
    }

    def show = {
        def externalResourceInstance = ExternalResource.get(params.id)
        if (!externalResourceInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'externalResource.label', default: 'ExternalResource'), params.id])}"
            redirect(action: "list")
        }
        else {
            [externalResourceInstance: externalResourceInstance]
        }
    }

    def edit = {
        def externalResourceInstance = ExternalResource.get(params.id)
        if (!externalResourceInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'externalResource.label', default: 'ExternalResource'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [externalResourceInstance: externalResourceInstance]
        }
    }

    def update = {
        def externalResourceInstance = ExternalResource.get(params.id)
        if (externalResourceInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (externalResourceInstance.version > version) {
                    
                    externalResourceInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'externalResource.label', default: 'ExternalResource')] as Object[], "Another user has updated this ExternalResource while you were editing")
                    render(view: "edit", model: [externalResourceInstance: externalResourceInstance])
                    return
                }
            }
            externalResourceInstance.properties = params
            if (!externalResourceInstance.hasErrors() && externalResourceInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'externalResource.label', default: 'ExternalResource'), externalResourceInstance.id])}"
                redirect(action: "show", id: externalResourceInstance.id)
            }
            else {
                render(view: "edit", model: [externalResourceInstance: externalResourceInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'externalResource.label', default: 'ExternalResource'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def externalResourceInstance = ExternalResource.get(params.id)
        if (externalResourceInstance) {
            try {
                externalResourceInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'externalResource.label', default: 'ExternalResource'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'externalResource.label', default: 'ExternalResource'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'externalResource.label', default: 'ExternalResource'), params.id])}"
            redirect(action: "list")
        }
    }
}
