package edu.umn.laccore.tmi

import grails.plugins.springsecurity.Secured
import org.grails.taggable.*

@Secured(['ROLE_ADMIN', 'IS_AUTHENTICATED_FULLY'])
class AdminController {

    static scaffold = false
	
	def adminService
	def searchableService
	
	
	def index = {
		[contentInstanceList: Content.findAllByGrailsControllerAndGrailsAction("${controllerName}","${actionName}")]
	}
	
	def reindexTags() {
		adminService.deleteTags()
		adminService.recreateTags()
		flashHelper.info "Tags have been reindexed"
		redirect(view:"index")	
	}
	
	def reindexSearch = {
		adminService.reindexSearch()
		flashHelper.info "Search indices have been reindexed"
		redirect(view:"index")
	}
	
	def startMirroring = {
		searchableService.startMirroring()
		flashHelper.info "Search mirroring has been restarted"
		redirect(view:"index")
	}
	
}
