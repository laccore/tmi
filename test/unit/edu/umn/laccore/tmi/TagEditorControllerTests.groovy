package edu.umn.laccore.tmi



import org.junit.*
import grails.test.mixin.*

@TestFor(TagEditorController)
@Mock(TagEditor)
class TagEditorControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/tagEditor/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.tagEditorInstanceList.size() == 0
        assert model.tagEditorInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.tagEditorInstance != null
    }

    void testSave() {
        controller.save()

        assert model.tagEditorInstance != null
        assert view == '/tagEditor/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/tagEditor/show/1'
        assert controller.flash.message != null
        assert TagEditor.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/tagEditor/list'

        populateValidParams(params)
        def tagEditor = new TagEditor(params)

        assert tagEditor.save() != null

        params.id = tagEditor.id

        def model = controller.show()

        assert model.tagEditorInstance == tagEditor
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/tagEditor/list'

        populateValidParams(params)
        def tagEditor = new TagEditor(params)

        assert tagEditor.save() != null

        params.id = tagEditor.id

        def model = controller.edit()

        assert model.tagEditorInstance == tagEditor
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/tagEditor/list'

        response.reset()

        populateValidParams(params)
        def tagEditor = new TagEditor(params)

        assert tagEditor.save() != null

        // test invalid parameters in update
        params.id = tagEditor.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/tagEditor/edit"
        assert model.tagEditorInstance != null

        tagEditor.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/tagEditor/show/$tagEditor.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        tagEditor.clearErrors()

        populateValidParams(params)
        params.id = tagEditor.id
        params.version = -1
        controller.update()

        assert view == "/tagEditor/edit"
        assert model.tagEditorInstance != null
        assert model.tagEditorInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/tagEditor/list'

        response.reset()

        populateValidParams(params)
        def tagEditor = new TagEditor(params)

        assert tagEditor.save() != null
        assert TagEditor.count() == 1

        params.id = tagEditor.id

        controller.delete()

        assert TagEditor.count() == 0
        assert TagEditor.get(tagEditor.id) == null
        assert response.redirectedUrl == '/tagEditor/list'
    }
}
