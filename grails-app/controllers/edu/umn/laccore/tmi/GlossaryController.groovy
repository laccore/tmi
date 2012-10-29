package edu.umn.laccore.tmi

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN', 'IS_AUTHENTICATED_FULLY'])
class GlossaryController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
	def index = {
        redirect(action: "list", params: params)
    }

    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
	def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [glossaryInstanceList: Glossary.list(params), glossaryInstanceTotal: Glossary.count()]
    }

    def create = {
        def glossaryInstance = new Glossary()
        glossaryInstance.properties = params
        return [glossaryInstance: glossaryInstance]
    }

    def save = {
        def glossaryInstance = new Glossary(params)
        if (glossaryInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'glossary.label', default: 'Glossary'), glossaryInstance.id])}"
            redirect(action: "show", id: glossaryInstance.id)
        }
        else {
            render(view: "create", model: [glossaryInstance: glossaryInstance])
        }
    }

    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
	def show = {
        def glossaryInstance = Glossary.get(params.id)
        if (!glossaryInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'glossary.label', default: 'Glossary'), params.id])}"
            redirect(action: "list")
        }
        else {
            [glossaryInstance: glossaryInstance]
        }
    }

    def edit = {
        def glossaryInstance = Glossary.get(params.id)
        if (!glossaryInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'glossary.label', default: 'Glossary'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [glossaryInstance: glossaryInstance]
        }
    }

    def update = {
        def glossaryInstance = Glossary.get(params.id)
        if (glossaryInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (glossaryInstance.version > version) {
                    
                    glossaryInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'glossary.label', default: 'Glossary')] as Object[], "Another user has updated this Glossary while you were editing")
                    render(view: "edit", model: [glossaryInstance: glossaryInstance])
                    return
                }
            }
            glossaryInstance.properties = params
            if (!glossaryInstance.hasErrors() && glossaryInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'glossary.label', default: 'Glossary'), glossaryInstance.id])}"
                redirect(action: "show", id: glossaryInstance.id)
            }
            else {
                render(view: "edit", model: [glossaryInstance: glossaryInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'glossary.label', default: 'Glossary'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def glossaryInstance = Glossary.get(params.id)
        if (glossaryInstance) {
            try {
                glossaryInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'glossary.label', default: 'Glossary'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'glossary.label', default: 'Glossary'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'glossary.label', default: 'Glossary'), params.id])}"
            redirect(action: "list")
        }
    }
}
