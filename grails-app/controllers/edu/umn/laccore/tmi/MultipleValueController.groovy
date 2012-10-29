package edu.umn.laccore.tmi

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN', 'IS_AUTHENTICATED_FULLY'])
class MultipleValueController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [multipleValueInstanceList: MultipleValue.list(params), multipleValueInstanceTotal: MultipleValue.count()]
    }

    def create = {
        def multipleValueInstance = new MultipleValue()
        multipleValueInstance.properties = params
        return [multipleValueInstance: multipleValueInstance]
    }

    def save = {
        def multipleValueInstance = new MultipleValue(params)
        if (multipleValueInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'multipleValue.label', default: 'MultipleValue'), multipleValueInstance.id])}"
            redirect(action: "show", id: multipleValueInstance.id)
        }
        else {
            render(view: "create", model: [multipleValueInstance: multipleValueInstance])
        }
    }

    def show = {
        def multipleValueInstance = MultipleValue.get(params.id)
        if (!multipleValueInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'multipleValue.label', default: 'MultipleValue'), params.id])}"
            redirect(action: "list")
        }
        else {
            [multipleValueInstance: multipleValueInstance]
        }
    }

    def edit = {
        def multipleValueInstance = MultipleValue.get(params.id)
        if (!multipleValueInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'multipleValue.label', default: 'MultipleValue'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [multipleValueInstance: multipleValueInstance]
        }
    }

    def update = {
        def multipleValueInstance = MultipleValue.get(params.id)
        if (multipleValueInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (multipleValueInstance.version > version) {
                    
                    multipleValueInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'multipleValue.label', default: 'MultipleValue')] as Object[], "Another user has updated this MultipleValue while you were editing")
                    render(view: "edit", model: [multipleValueInstance: multipleValueInstance])
                    return
                }
            }
            multipleValueInstance.properties = params
            if (!multipleValueInstance.hasErrors() && multipleValueInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'multipleValue.label', default: 'MultipleValue'), multipleValueInstance.id])}"
                redirect(action: "show", id: multipleValueInstance.id)
            }
            else {
                render(view: "edit", model: [multipleValueInstance: multipleValueInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'multipleValue.label', default: 'MultipleValue'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def multipleValueInstance = MultipleValue.get(params.id)
        if (multipleValueInstance) {
            try {
                multipleValueInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'multipleValue.label', default: 'MultipleValue'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'multipleValue.label', default: 'MultipleValue'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'multipleValue.label', default: 'MultipleValue'), params.id])}"
            redirect(action: "list")
        }
    }
}
