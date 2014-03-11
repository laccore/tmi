package edu.umn.laccore.tmi

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN', 'IS_AUTHENTICATED_FULLY'])
class CoreFaceAnnotationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [coreFaceAnnotationInstanceList: CoreFaceAnnotation.list(params), coreFaceAnnotationInstanceTotal: CoreFaceAnnotation.count()]
    }

    def create() {
        [coreFaceAnnotationInstance: new CoreFaceAnnotation(params)]
    }

    def save() {
        def coreFaceAnnotationInstance = new CoreFaceAnnotation(params)
        if (!coreFaceAnnotationInstance.save(flush: true)) {
            render(view: "create", model: [coreFaceAnnotationInstance: coreFaceAnnotationInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'coreFaceAnnotation.label', default: 'CoreFaceAnnotation'), coreFaceAnnotationInstance.id])
        redirect(action: "show", id: coreFaceAnnotationInstance.id)
    }

    def show(Long id) {
        def coreFaceAnnotationInstance = CoreFaceAnnotation.get(id)
        if (!coreFaceAnnotationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'coreFaceAnnotation.label', default: 'CoreFaceAnnotation'), id])
            redirect(action: "list")
            return
        }

        [coreFaceAnnotationInstance: coreFaceAnnotationInstance]
    }

    def edit(Long id) {
        def coreFaceAnnotationInstance = CoreFaceAnnotation.get(id)
        if (!coreFaceAnnotationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'coreFaceAnnotation.label', default: 'CoreFaceAnnotation'), id])
            redirect(action: "list")
            return
        }

        [coreFaceAnnotationInstance: coreFaceAnnotationInstance]
    }

    def update(Long id, Long version) {
        def coreFaceAnnotationInstance = CoreFaceAnnotation.get(id)
        if (!coreFaceAnnotationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'coreFaceAnnotation.label', default: 'CoreFaceAnnotation'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (coreFaceAnnotationInstance.version > version) {
                coreFaceAnnotationInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'coreFaceAnnotation.label', default: 'CoreFaceAnnotation')] as Object[],
                          "Another user has updated this CoreFaceAnnotation while you were editing")
                render(view: "edit", model: [coreFaceAnnotationInstance: coreFaceAnnotationInstance])
                return
            }
        }

        coreFaceAnnotationInstance.properties = params

        if (!coreFaceAnnotationInstance.save(flush: true)) {
            render(view: "edit", model: [coreFaceAnnotationInstance: coreFaceAnnotationInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'coreFaceAnnotation.label', default: 'CoreFaceAnnotation'), coreFaceAnnotationInstance.id])
        redirect(action: "show", id: coreFaceAnnotationInstance.id)
    }

    def delete(Long id) {
        def coreFaceAnnotationInstance = CoreFaceAnnotation.get(id)
        if (!coreFaceAnnotationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'coreFaceAnnotation.label', default: 'CoreFaceAnnotation'), id])
            redirect(action: "list")
            return
        }

        try {
            coreFaceAnnotationInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'coreFaceAnnotation.label', default: 'CoreFaceAnnotation'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'coreFaceAnnotation.label', default: 'CoreFaceAnnotation'), id])
            redirect(action: "show", id: id)
        }
    }
}
