package edu.umn.laccore.tmi

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN', 'IS_AUTHENTICATED_FULLY'])
class ImposterController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [imposterInstanceList: Imposter.list(params), imposterInstanceTotal: Imposter.count()]
    }

    def create = {
        def imposterInstance = new Imposter()
        imposterInstance.properties = params
        return [imposterInstance: imposterInstance]
    }

    def save = {
        def imposterInstance = new Imposter(params)
        if (imposterInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'imposter.label', default: 'Imposter'), imposterInstance.id])}"
            redirect(action: "show", id: imposterInstance.id)
        }
        else {
            render(view: "create", model: [imposterInstance: imposterInstance])
        }
    }

    def show = {
        def imposterInstance = Imposter.get(params.id)
        if (!imposterInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'imposter.label', default: 'Imposter'), params.id])}"
            redirect(action: "list")
        }
        else {
            [imposterInstance: imposterInstance]
        }
    }

    def edit = {
        def imposterInstance = Imposter.get(params.id)
        if (!imposterInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'imposter.label', default: 'Imposter'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [imposterInstance: imposterInstance]
        }
    }

    def update = {
        def imposterInstance = Imposter.get(params.id)
        if (imposterInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (imposterInstance.version > version) {
                    
                    imposterInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'imposter.label', default: 'Imposter')] as Object[], "Another user has updated this Imposter while you were editing")
                    render(view: "edit", model: [imposterInstance: imposterInstance])
                    return
                }
            }
            imposterInstance.properties = params
            if (!imposterInstance.hasErrors() && imposterInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'imposter.label', default: 'Imposter'), imposterInstance.id])}"
                redirect(action: "show", id: imposterInstance.id)
            }
            else {
                render(view: "edit", model: [imposterInstance: imposterInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'imposter.label', default: 'Imposter'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def imposterInstance = Imposter.get(params.id)
        if (imposterInstance) {
            try {
                imposterInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'imposter.label', default: 'Imposter'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'imposter.label', default: 'Imposter'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'imposter.label', default: 'Imposter'), params.id])}"
            redirect(action: "list")
        }
    }
}
