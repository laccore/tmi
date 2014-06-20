package edu.umn.laccore.tmi

import grails.plugins.springsecurity.Secured

import org.springframework.dao.DataIntegrityViolationException

@Secured(['ROLE_ADMIN', 'IS_AUTHENTICATED_FULLY'])
class DriveSectionController extends UserScopeableController {

    static scaffold = true

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def create() {
		def section = new DriveSection(params)
		section.user = currentUser
		[driveSectionInstance: section]
	}

	/*
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [driveSectionInstanceList: DriveSection.list(params), driveSectionInstanceTotal: DriveSection.count()]
    }

    def create() {
        [driveSectionInstance: new DriveSection(params)]
    }

    def save() {
        def driveSectionInstance = new DriveSection(params)
        if (!driveSectionInstance.save(flush: true)) {
            render(view: "create", model: [driveSectionInstance: driveSectionInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'driveSection.label', default: 'DriveSection'), driveSectionInstance.id])
        redirect(action: "show", id: driveSectionInstance.id)
    }

    def show(Long id) {
        def driveSectionInstance = DriveSection.get(id)
        if (!driveSectionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'driveSection.label', default: 'DriveSection'), id])
            redirect(action: "list")
            return
        }

        [driveSectionInstance: driveSectionInstance]
    }

    def edit(Long id) {
        def driveSectionInstance = DriveSection.get(id)
        if (!driveSectionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'driveSection.label', default: 'DriveSection'), id])
            redirect(action: "list")
            return
        }

        [driveSectionInstance: driveSectionInstance]
    }

    def update(Long id, Long version) {
        def driveSectionInstance = DriveSection.get(id)
        if (!driveSectionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'driveSection.label', default: 'DriveSection'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (driveSectionInstance.version > version) {
                driveSectionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'driveSection.label', default: 'DriveSection')] as Object[],
                          "Another user has updated this DriveSection while you were editing")
                render(view: "edit", model: [driveSectionInstance: driveSectionInstance])
                return
            }
        }

        driveSectionInstance.properties = params

        if (!driveSectionInstance.save(flush: true)) {
            render(view: "edit", model: [driveSectionInstance: driveSectionInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'driveSection.label', default: 'DriveSection'), driveSectionInstance.id])
        redirect(action: "show", id: driveSectionInstance.id)
    }

    def delete(Long id) {
        def driveSectionInstance = DriveSection.get(id)
        if (!driveSectionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'driveSection.label', default: 'DriveSection'), id])
            redirect(action: "list")
            return
        }

        try {
            driveSectionInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'driveSection.label', default: 'DriveSection'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'driveSection.label', default: 'DriveSection'), id])
            redirect(action: "show", id: id)
        }
    }
    */
}
