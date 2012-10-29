package edu.umn.laccore.tmi

import grails.plugins.springsecurity.Secured
import org.grails.taggable.*

@Secured(['ROLE_ADMIN', 'IS_AUTHENTICATED_FULLY'])
class AdminController {

    static scaffold = false
	
	def searchableService
	
	def index = {
		//log.error "controller and action: $controllerName $actionName"
		[contentInstanceList: Content.findAllByGrailsControllerAndGrailsAction("${controllerName}","${actionName}")]
	}
	
	def reindexTags = {
		deleteTags()
		recreateTags()
		flashHelper.info "Tags have been reindexed"
		redirect(view:"index")	
	}
	
	def reindexSearch = {
		reindexSearch()
		flashHelper.info "Search indices have been reindexed"
		redirect(view:"index")
	}
	
	def startMirroring = {
		searchableService.startMirroring()
		flashHelper.info "Search mirroring has been restarted"
		redirect(view:"index")
	}
	
	private reindexSearch () {
		searchableService.startMirroring()
		Image.reindex()
		UniqueIdentification.reindex()
    }
	
	private deleteTags() {
		TagLink.executeUpdate("delete from TagLink")//TagLink
		Tag.executeUpdate("delete from Tag")//Tag
		
	}
	
	private recreateTags() {
		def uiList = UniqueIdentification.getAll()
		uiList.each { ui ->
			if (ui.uiTags) ui.parseTags(ui.uiTags, " ")
			if (ui.distinguishingFeatures) ui.parseTags(ui.distinguishingFeatures, "\n")
		}
		def imageList = Image.getAll()
		imageList.each { i ->
			if (i.uiTags) i.parseTags(i.uiTags, " ")
		}
	}
}
