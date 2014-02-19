package edu.umn.laccore.tmi

import groovy.sql.Sql

//@Secured(['ROLE_ADMIN', 'IS_AUTHENTICATED_FULLY'])
class TagEditorController {
	static scaffold=true
	def dataSource
    def save() {
        def tagEditorInstance = new TagEditor(params)
        replaceAndUpdate(tagEditorInstance)
        if (!tagEditorInstance.save(flush: true)) {
            render(view: "create", model: [tagEditorInstance: tagEditorInstance])
            return
        }
        flash.message = message(code: 'default.created.message', args: [message(code: 'tagEditor.label', default: 'TagEditor'), tagEditorInstance.id])
        redirect(action: "show", id: tagEditorInstance.id)
    }
	
	private replaceAndUpdate(tagEditor) {
		//http://groovy.codehaus.org/api/groovy/sql/Sql.html
		//def sql = new Sql(dataSource)
		//sql.executeUpdate("update node set ui_tags=replace(ui_tags,?,?)",[tagEditor.oldTag,tagEditor.newTag])
		
		//find instances matching the 4 types
		//for each, remove old tag, add new tag
		
		//beware - wildcarded like queries may match on substrings within non-intended tags - must construct cases for beginning, middle and end, as well as single tag matches
		def replacement = [
			types:["beginning","middle","end","single"],
			beginning:[current:"${tagEditor.oldTag} " , new:"${tagEditor.newTag} ", likeTerm:"${tagEditor.oldTag} %"],
			middle:[current:" ${tagEditor.oldTag} " , new:" ${tagEditor.newTag} ", likeTerm:"% ${tagEditor.oldTag} %"],
			end:[current:" ${tagEditor.oldTag}" , new:" ${tagEditor.newTag}", likeTerm:"% ${tagEditor.oldTag}"],
			single:[current:"${tagEditor.oldTag}" , new:"${tagEditor.newTag}", likeTerm:"${tagEditor.oldTag}"],
		]	

		replacement.types.each { type ->
			println type
			def r = replacement[type]
			println "^^^${r.likeTerm}^^^"
			def images = Image.findAllByUiTagsLike(r.likeTerm)
			images.each { i ->
				println "$type: $i.id"
				tagEditor.addToAffectedImages(i)
				tagEditor.imagesUpdated+=1
				//i.removeTag(tagEditor.oldTag)
				//i.save(flush:true)
				i.addTag(tagEditor.newTag.toString()).save()
			}

			def components = UniqueIdentification.findAllByUiTagsLike(r.likeTerm)
			//sql.executeUpdate("update image set i_tags=replace(ui_tags,?,?)",[tagEditor.oldTag,tagEditor.newTag])
			components.each { c ->
				tagEditor.addToAffectedComponents(c)
				tagEditor.componentsUpdated+=1
			}	
		}
	}
	
	/*static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [tagEditorInstanceList: TagEditor.list(params), tagEditorInstanceTotal: TagEditor.count()]
    }

    def create() {
        [tagEditorInstance: new TagEditor(params)]
    }

    def save() {
        def tagEditorInstance = new TagEditor(params)
        if (!tagEditorInstance.save(flush: true)) {
            render(view: "create", model: [tagEditorInstance: tagEditorInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'tagEditor.label', default: 'TagEditor'), tagEditorInstance.id])
        redirect(action: "show", id: tagEditorInstance.id)
    }

    def show(Long id) {
        def tagEditorInstance = TagEditor.get(id)
        if (!tagEditorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tagEditor.label', default: 'TagEditor'), id])
            redirect(action: "list")
            return
        }

        [tagEditorInstance: tagEditorInstance]
    }

    def edit(Long id) {
        def tagEditorInstance = TagEditor.get(id)
        if (!tagEditorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tagEditor.label', default: 'TagEditor'), id])
            redirect(action: "list")
            return
        }

        [tagEditorInstance: tagEditorInstance]
    }

    def update(Long id, Long version) {
        def tagEditorInstance = TagEditor.get(id)
        if (!tagEditorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tagEditor.label', default: 'TagEditor'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (tagEditorInstance.version > version) {
                tagEditorInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'tagEditor.label', default: 'TagEditor')] as Object[],
                          "Another user has updated this TagEditor while you were editing")
                render(view: "edit", model: [tagEditorInstance: tagEditorInstance])
                return
            }
        }

        tagEditorInstance.properties = params

        if (!tagEditorInstance.save(flush: true)) {
            render(view: "edit", model: [tagEditorInstance: tagEditorInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'tagEditor.label', default: 'TagEditor'), tagEditorInstance.id])
        redirect(action: "show", id: tagEditorInstance.id)
    }

    def delete(Long id) {
        def tagEditorInstance = TagEditor.get(id)
        if (!tagEditorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tagEditor.label', default: 'TagEditor'), id])
            redirect(action: "list")
            return
        }

        try {
            tagEditorInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'tagEditor.label', default: 'TagEditor'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'tagEditor.label', default: 'TagEditor'), id])
            redirect(action: "show", id: id)
        }
    }*/
}
