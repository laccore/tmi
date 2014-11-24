package edu.umn.laccore.tmi

class ScaffoldController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [scaffoldInstanceList: Scaffold.list(params), scaffoldInstanceTotal: Scaffold.count()]
    }

    def create = {
        def scaffoldInstance = new Scaffold()
        scaffoldInstance.properties = params
        return [scaffoldInstance: scaffoldInstance]
    }

    def save = {
        def scaffoldInstance = new Scaffold(params)
        if (scaffoldInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'scaffold.label', default: 'Scaffold'), scaffoldInstance.id])}"
            redirect(action: "show", id: scaffoldInstance.id)
        }
        else {
            render(view: "create", model: [scaffoldInstance: scaffoldInstance])
        }
    }

    def show = {
        def scaffoldInstance = Scaffold.get(params.id)
        if (!scaffoldInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'scaffold.label', default: 'Scaffold'), params.id])}"
            redirect(action: "list")
        }
        else {
            [scaffoldInstance: scaffoldInstance]
        }
    }

    def edit = {
        def scaffoldInstance = Scaffold.get(params.id)
        if (!scaffoldInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'scaffold.label', default: 'Scaffold'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [scaffoldInstance: scaffoldInstance]
        }
    }

    def update = {
        def scaffoldInstance = Scaffold.get(params.id)
        if (scaffoldInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (scaffoldInstance.version > version) {
                    
                    scaffoldInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'scaffold.label', default: 'Scaffold')] as Object[], "Another user has updated this Scaffold while you were editing")
                    render(view: "edit", model: [scaffoldInstance: scaffoldInstance])
                    return
                }
            }
            scaffoldInstance.properties = params
            if (!scaffoldInstance.hasErrors() && scaffoldInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'scaffold.label', default: 'Scaffold'), scaffoldInstance.id])}"
                redirect(action: "show", id: scaffoldInstance.id)
            }
            else {
                render(view: "edit", model: [scaffoldInstance: scaffoldInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'scaffold.label', default: 'Scaffold'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def scaffoldInstance = Scaffold.get(params.id)
        if (scaffoldInstance) {
            try {
                scaffoldInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'scaffold.label', default: 'Scaffold'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'scaffold.label', default: 'Scaffold'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'scaffold.label', default: 'Scaffold'), params.id])}"
            redirect(action: "list")
        }
    }
}
