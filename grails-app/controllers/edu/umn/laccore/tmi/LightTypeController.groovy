package edu.umn.laccore.tmi

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN', 'IS_AUTHENTICATED_FULLY'])
class LightTypeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	static scaffold = true

/*
	def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [lightTypeInstanceList: LightType.list(params), lightTypeInstanceTotal: LightType.count()]
    }

    def create = {
        def lightTypeInstance = new LightType()
        lightTypeInstance.properties = params
        return [lightTypeInstance: lightTypeInstance]
    }

    def save = {
        def lightTypeInstance = new LightType(params)
        if (lightTypeInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'lightType.label', default: 'LightType'), lightTypeInstance.id])}"
            redirect(action: "show", id: lightTypeInstance.id)
        }
        else {
            render(view: "create", model: [lightTypeInstance: lightTypeInstance])
        }
    }

    def show = {
        def lightTypeInstance = LightType.get(params.id)
        if (!lightTypeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'lightType.label', default: 'LightType'), params.id])}"
            redirect(action: "list")
        }
        else {
            [lightTypeInstance: lightTypeInstance]
        }
    }

    def edit = {
        def lightTypeInstance = LightType.get(params.id)
        if (!lightTypeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'lightType.label', default: 'LightType'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [lightTypeInstance: lightTypeInstance]
        }
    }

    def update = {
        def lightTypeInstance = LightType.get(params.id)
        if (lightTypeInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (lightTypeInstance.version > version) {
                    
                    lightTypeInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'lightType.label', default: 'LightType')] as Object[], "Another user has updated this LightType while you were editing")
                    render(view: "edit", model: [lightTypeInstance: lightTypeInstance])
                    return
                }
            }
            lightTypeInstance.properties = params
            if (!lightTypeInstance.hasErrors() && lightTypeInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'lightType.label', default: 'LightType'), lightTypeInstance.id])}"
                redirect(action: "show", id: lightTypeInstance.id)
            }
            else {
                render(view: "edit", model: [lightTypeInstance: lightTypeInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'lightType.label', default: 'LightType'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def lightTypeInstance = LightType.get(params.id)
        if (lightTypeInstance) {
            try {
                lightTypeInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'lightType.label', default: 'LightType'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'lightType.label', default: 'LightType'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'lightType.label', default: 'LightType'), params.id])}"
            redirect(action: "list")
        }
    }
*/
}
