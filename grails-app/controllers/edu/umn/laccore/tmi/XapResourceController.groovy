package edu.umn.laccore.tmi

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN', 'IS_AUTHENTICATED_FULLY'])
class XapResourceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def xapService
	def grailsApplication

	def refreshXap() {
		xapService.refreshXap()
		render(text:xapRefreshInfo(),contentType:"text/plain",encoding:"UTF-8")
	}
	
	@Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
	def xap() {
		//http://msdn.microsoft.com/en-us/magazine/dd315412.aspx
		//http://social.msdn.microsoft.com/Forums/silverlight/en-US/859ee80b-ef5b-46db-aa1c-6e07d1fedb81/display-xap-file-from-a-different-server
		//http://msdn.microsoft.com/en-us/library/cc838250(v=vs.95).aspx
		//http://msdn.microsoft.com/en-us/library/cc189008(v=vs.95).aspx
		//http://www.iis.net/learn/web-hosting/web-server-for-shared-hosting/configuring-iis-for-silverlight-applications
		println "calling xap"
		File f = new File("${grailsApplication.config.pivot.staging.dir}/deployment/TmiPivotDeployment.xap")
		response.setContentType("application/x-silverlight-app")
		//response.setHeader("Content-disposition", "attachment;filename=${f.getName()}")
		response.outputStream << f.newInputStream() // Performing a binary stream copy
		
	}
	
	private String xapRefreshInfo() {
		def info=""
		def files = [
		             "sterr":new File("${grailsApplication.config.pivot.staging.dir}/logs/err.log"),
					 "stdout":new File("${grailsApplication.config.pivot.staging.dir}/logs/out.log"),
					 "bash script":new File("${grailsApplication.config.pivot.staging.dir}/script/pivotpackager.sh")
		]
		info += "last XAP packaging run .... \n\n"
		files.each { k,v ->
			info += "----------------------${k}: ${v.absolutePath} (${new Date (v.lastModified())})----------------------\n"
			info += "${v.text}"
			info += "\n\n"
		}
		println info
		info 
	}
	
	def lastRun() {
		render(text:xapRefreshInfo(),contentType:"text/plain",encoding:"UTF-8")
	}
	
	
	//std controller actions
	
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [xapResourceInstanceList: XapResource.list(params), xapResourceInstanceTotal: XapResource.count()]
    }

    def create() {
        [xapResourceInstance: new XapResource(params)]
    }

    def save() {
        def xapResourceInstance = new XapResource(params)
        if (!xapResourceInstance.save(flush: true)) {
            render(view: "create", model: [xapResourceInstance: xapResourceInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'xapResource.label', default: 'XapResource'), xapResourceInstance.id])
        redirect(action: "show", id: xapResourceInstance.id)
    }

    def show(Long id) {
        def xapResourceInstance = XapResource.get(id)
        if (!xapResourceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'xapResource.label', default: 'XapResource'), id])
            redirect(action: "list")
            return
        }

        [xapResourceInstance: xapResourceInstance]
    }

    def edit(Long id) {
        def xapResourceInstance = XapResource.get(id)
        if (!xapResourceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'xapResource.label', default: 'XapResource'), id])
            redirect(action: "list")
            return
        }

        [xapResourceInstance: xapResourceInstance]
    }

    def update(Long id, Long version) {
        println params
		
		def xapResourceInstance = XapResource.get(id)
        if (!xapResourceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'xapResource.label', default: 'XapResource'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (xapResourceInstance.version > version) {
                xapResourceInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'xapResource.label', default: 'XapResource')] as Object[],
                          "Another user has updated this XapResource while you were editing")
                render(view: "edit", model: [xapResourceInstance: xapResourceInstance])
                return
            }
        }

        xapResourceInstance.properties = params

        if (!xapResourceInstance.save(flush: true)) {
            render(view: "edit", model: [xapResourceInstance: xapResourceInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'xapResource.label', default: 'XapResource'), xapResourceInstance.id])
        redirect(action: "show", id: xapResourceInstance.id)
    }

    def delete(Long id) {
        def xapResourceInstance = XapResource.get(id)
        if (!xapResourceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'xapResource.label', default: 'XapResource'), id])
            redirect(action: "list")
            return
        }

        try {
            xapResourceInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'xapResource.label', default: 'XapResource'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'xapResource.label', default: 'XapResource'), id])
            redirect(action: "show", id: id)
        }
    }
}
