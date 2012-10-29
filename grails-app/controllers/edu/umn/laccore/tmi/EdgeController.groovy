package edu.umn.laccore.tmi

import grails.plugins.springsecurity.Secured

import org.grails.plugins.imagetools.*
import grails.plugins.springsecurity.Secured
import org.apache.commons.fileupload.disk.DiskFileItem
import org.apache.commons.fileupload.disk.DiskFileItemFactory
import org.apache.commons.fileupload.FileItem
//import org.springframework.web.multipart.commons.CommonsMultipartFile

@Secured(['ROLE_ADMIN', 'IS_AUTHENTICATED_FULLY'])
class EdgeController {
	def allowedExtensions = ["JPG", "JPEG", "GIF", "PNG"]
	def EDGE_DIR = grailsApplication.config.edge.images.location
    
	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [edgeInstanceList: Edge.list(params), edgeInstanceTotal: Edge.count()]
    }

    def create = {
        def edgeInstance = new Edge()
        edgeInstance.properties = params
        return [edgeInstance: edgeInstance]
    }

    def save = {
        def edgeInstance = new Edge(params)
        
		def uploadedFile = request.getFile('payload')
			// update file, if new file one provided
			if(!uploadedFile.empty) {
				def fileExtension = "${uploadedFile.originalFilename}".split("\\.")[-1].toUpperCase()
				if (!allowedExtensions.contains(fileExtension)) {
					def extensions = "${allowedExtensions}"
					flash.message = "Filetype extension not in permitted list - ${allowedExtensions}"
					render(view: "create", model: [edgeInstance: edgeInstance])
					return
				}
				// save and process image
				uploadedFile.transferTo(new File(EDGE_DIR, uploadedFile.originalFilename))
				edgeInstance.imageName = uploadedFile.originalFilename
				//PermissionSetter.assignReadWriteToContents(EDGE_DIR)
			}
		
		if (edgeInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'edge.label', default: 'Edge'), edgeInstance.id])}"
            redirect(action: "show", id: edgeInstance.id)
        }
        else {
            render(view: "create", model: [edgeInstance: edgeInstance])
        }
    }

    def show = {
        def edgeInstance = Edge.get(params.id)
        if (!edgeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'edge.label', default: 'Edge'), params.id])}"
            redirect(action: "list")
        }
        else {
            [edgeInstance: edgeInstance]
        }
    }

    def edit = {
        def edgeInstance = Edge.get(params.id)
        if (!edgeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'edge.label', default: 'Edge'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [edgeInstance: edgeInstance]
        }
    }

    def update = {
        def edgeInstance = Edge.get(params.id)
        if (edgeInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (edgeInstance.version > version) {
                    
                    edgeInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'edge.label', default: 'Edge')] as Object[], "Another user has updated this Edge while you were editing")
                    render(view: "edit", model: [edgeInstance: edgeInstance])
                    return
                }
            }
            edgeInstance.properties = params
			def uploadedFile = request.getFile('payload')
			// update file, if new file one provided
			if(!uploadedFile.empty) {
				def fileExtension = "${uploadedFile.originalFilename}".split("\\.")[-1].toUpperCase()
				if (!allowedExtensions.contains(fileExtension)) {
					def extensions = "${allowedExtensions}"
					flash.message = "Filetype extension not in permitted list - ${allowedExtensions}"
					render(view: "create", model: [edgeInstance: edgeInstance])
					return
				}
				//del existing file
				if (edgeInstance.imageName) new File(EDGE_DIR + "/" + edgeInstance.imageName).delete()
				// save and process image
				uploadedFile.transferTo(new File(EDGE_DIR, uploadedFile.originalFilename))
				edgeInstance.imageName = uploadedFile.originalFilename
				//PermissionSetter.assignReadWriteToContents(EDGE_DIR)
			}
			
            if (!edgeInstance.hasErrors() && edgeInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'edge.label', default: 'Edge'), edgeInstance.id])}"
                redirect(action: "show", id: edgeInstance.id)
            }
            else {
                render(view: "edit", model: [edgeInstance: edgeInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'edge.label', default: 'Edge'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def edgeInstance = Edge.get(params.id)
        if (edgeInstance) {
            try {
				//del existing file
				if (edgeInstance.imageName) new File(EDGE_DIR + "/" + edgeInstance.imageName).delete()
                edgeInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'edge.label', default: 'Edge'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'edge.label', default: 'Edge'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'edge.label', default: 'Edge'), params.id])}"
            redirect(action: "list")
        }
    }
}
