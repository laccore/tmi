package edu.umn.laccore.tmi

import org.apache.catalina.startup.TldConfig;

import grails.plugins.springsecurity.Secured

@Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
class TagsController {
	
	def taggableService	

    static scaffold = false
	
	def find = {
		log.error "find tag: $params.id"		//def content = Content.findAllBy(grailsController:$controllerName, grailsAction:$actionName)
		//List all tags since there isn't a Tag domain object
		String listAllHQL = """
			SELECT tagLink
			FROM TagLink tagLink
			WHERE tag.name='$params.id'
			"""
		def allTagLinks = UniqueIdentification.executeQuery(listAllHQL)
		log.error allTagLinks.size()
		def entities = lookupTaggedEntites(allTagLinks)
		[uniqueIdentifications:entities['uniqueIdentifications'], images:entities['images']]
	}
	
	def lookupTaggedEntites(allTagLinks) {
		def entitiesMap = [:]
		def ui = []
		def i = []
		allTagLinks.each { tl ->
			if(tl.type=='uniqueIdentification') {
				println "ui added"
				ui.add(UniqueIdentification.get(tl.tagRef))
			} else {
				i.add(Image.get(tl.tagRef))	
				println "image added"
			}
		}
		entitiesMap.put('uniqueIdentifications',ui)
		entitiesMap.put('images',i)
		return entitiesMap
	}
}

/*
I noticed though that since aliases are stored in a Map and not directly in the bean registry, that ctx.getBeanDefinitionNames() only returns ÔrealÕ bean names and no aliases. But it turns out that itÕs pretty simple to get all bean names and aliases:

def allNames = [] as Set
ctx.beanDefinitionNames.each { name ->
	allNames << name
	ctx.getAliases(name).each { alias -> allNames << alias }
}
*/

/*
tag has 0..n tagLinks
data below is for TagLink class, id=1 related by tagId=1 (FK) to Tag table
tagRef (27) is the id of the class type (UniqueIdentification) that was tagged with Tag.id=1 ('test')

id:1
tagId:1 
tagRef:21 
tag:test 
type:uniqueIdentification  
*/