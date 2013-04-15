package edu.umn.laccore.tmi

import org.grails.taggable.Tag
import org.grails.taggable.TagLink

class AdminService {
	//def grailsApplication
	def searchableService
	
	def reindexSearch() {
		searchableService.startMirroring()
		Image.reindex()
		UniqueIdentification.reindex()
		Tag.reindex()
	}
	
	def deleteTags() {
		TagLink.executeUpdate("delete from TagLink")//TagLink
		Tag.executeUpdate("delete from Tag")//Tag
	}
	
	def recreateTags() {
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