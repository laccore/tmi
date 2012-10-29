package edu.umn.laccore.tmi

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN', 'IS_AUTHENTICATED_FULLY'])
class CorerTypeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [corerTypeInstanceList: CorerType.list(params), corerTypeInstanceTotal: CorerType.count()]
    }

    def create = {
        def corerTypeInstance = new CorerType()
        corerTypeInstance.properties = params
        return [corerTypeInstance: corerTypeInstance]
    }

    def save = {
        def corerTypeInstance = new CorerType(params)
        if (corerTypeInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'corerType.label', default: 'CorerType'), corerTypeInstance.id])}"
            redirect(action: "show", id: corerTypeInstance.id)
        }
        else {
            render(view: "create", model: [corerTypeInstance: corerTypeInstance])
        }
    }

    def show = {
        def corerTypeInstance = CorerType.get(params.id)
        if (!corerTypeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'corerType.label', default: 'CorerType'), params.id])}"
            redirect(action: "list")
        }
        else {
            [corerTypeInstance: corerTypeInstance]
        }
    }

    def edit = {
        def corerTypeInstance = CorerType.get(params.id)
        if (!corerTypeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'corerType.label', default: 'CorerType'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [corerTypeInstance: corerTypeInstance]
        }
    }

    def update = {
        def corerTypeInstance = CorerType.get(params.id)
        if (corerTypeInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (corerTypeInstance.version > version) {
                    
                    corerTypeInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'corerType.label', default: 'CorerType')] as Object[], "Another user has updated this CorerType while you were editing")
                    render(view: "edit", model: [corerTypeInstance: corerTypeInstance])
                    return
                }
            }
            corerTypeInstance.properties = params
            if (!corerTypeInstance.hasErrors() && corerTypeInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'corerType.label', default: 'CorerType'), corerTypeInstance.id])}"
                redirect(action: "show", id: corerTypeInstance.id)
            }
            else {
                render(view: "edit", model: [corerTypeInstance: corerTypeInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'corerType.label', default: 'CorerType'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def corerTypeInstance = CorerType.get(params.id)
        if (corerTypeInstance) {
            try {
                corerTypeInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'corerType.label', default: 'CorerType'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'corerType.label', default: 'CorerType'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'corerType.label', default: 'CorerType'), params.id])}"
            redirect(action: "list")
        }
    }
}
