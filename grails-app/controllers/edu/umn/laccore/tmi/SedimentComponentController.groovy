package edu.umn.laccore.tmi

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN', 'IS_AUTHENTICATED_FULLY'])
class SedimentComponentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    static scaffold=true
	
	/*def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 20, 100)
        [sedimentComponentInstanceList: SedimentComponent.list(params), sedimentComponentInstanceTotal: SedimentComponent.count()]
    }

    def create() {
        [sedimentComponentInstance: new SedimentComponent(params)]
    }

    def save() {
        def sedimentComponentInstance = new SedimentComponent(params)
        if (!sedimentComponentInstance.save(flush: true)) {
            render(view: "create", model: [sedimentComponentInstance: sedimentComponentInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'sedimentComponent.label', default: 'SedimentComponent'), sedimentComponentInstance.id])
        redirect(action: "show", id: sedimentComponentInstance.id)
    }

    def show(Long id) {
        def sedimentComponentInstance = SedimentComponent.get(id)
        if (!sedimentComponentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sedimentComponent.label', default: 'SedimentComponent'), id])
            redirect(action: "list")
            return
        }

        [sedimentComponentInstance: sedimentComponentInstance]
    }

    def edit(Long id) {
        def sedimentComponentInstance = SedimentComponent.get(id)
        if (!sedimentComponentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sedimentComponent.label', default: 'SedimentComponent'), id])
            redirect(action: "list")
            return
        }

        [sedimentComponentInstance: sedimentComponentInstance]
    }

    def update(Long id, Long version) {
        def sedimentComponentInstance = SedimentComponent.get(id)
        if (!sedimentComponentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sedimentComponent.label', default: 'SedimentComponent'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (sedimentComponentInstance.version > version) {
                sedimentComponentInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'sedimentComponent.label', default: 'SedimentComponent')] as Object[],
                          "Another user has updated this SedimentComponent while you were editing")
                render(view: "edit", model: [sedimentComponentInstance: sedimentComponentInstance])
                return
            }
        }

        sedimentComponentInstance.properties = params

        if (!sedimentComponentInstance.save(flush: true)) {
            render(view: "edit", model: [sedimentComponentInstance: sedimentComponentInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'sedimentComponent.label', default: 'SedimentComponent'), sedimentComponentInstance.id])
        redirect(action: "show", id: sedimentComponentInstance.id)
    }

    def delete(Long id) {
        def sedimentComponentInstance = SedimentComponent.get(id)
        if (!sedimentComponentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sedimentComponent.label', default: 'SedimentComponent'), id])
            redirect(action: "list")
            return
        }

        try {
            sedimentComponentInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'sedimentComponent.label', default: 'SedimentComponent'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'sedimentComponent.label', default: 'SedimentComponent'), id])
            redirect(action: "show", id: id)
        }
    }
    */
}
