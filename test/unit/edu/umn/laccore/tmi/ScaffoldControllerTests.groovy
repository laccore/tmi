package edu.umn.laccore.tmi



import org.junit.*
import grails.test.mixin.*

@TestFor(ScaffoldController)
@Mock(Scaffold)
class ScaffoldControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/scaffold/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.scaffoldInstanceList.size() == 0
        assert model.scaffoldInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.scaffoldInstance != null
    }

    void testSave() {
        controller.save()

        assert model.scaffoldInstance != null
        assert view == '/scaffold/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/scaffold/show/1'
        assert controller.flash.message != null
        assert Scaffold.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/scaffold/list'

        populateValidParams(params)
        def scaffold = new Scaffold(params)

        assert scaffold.save() != null

        params.id = scaffold.id

        def model = controller.show()

        assert model.scaffoldInstance == scaffold
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/scaffold/list'

        populateValidParams(params)
        def scaffold = new Scaffold(params)

        assert scaffold.save() != null

        params.id = scaffold.id

        def model = controller.edit()

        assert model.scaffoldInstance == scaffold
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/scaffold/list'

        response.reset()

        populateValidParams(params)
        def scaffold = new Scaffold(params)

        assert scaffold.save() != null

        // test invalid parameters in update
        params.id = scaffold.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/scaffold/edit"
        assert model.scaffoldInstance != null

        scaffold.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/scaffold/show/$scaffold.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        scaffold.clearErrors()

        populateValidParams(params)
        params.id = scaffold.id
        params.version = -1
        controller.update()

        assert view == "/scaffold/edit"
        assert model.scaffoldInstance != null
        assert model.scaffoldInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/scaffold/list'

        response.reset()

        populateValidParams(params)
        def scaffold = new Scaffold(params)

        assert scaffold.save() != null
        assert Scaffold.count() == 1

        params.id = scaffold.id

        controller.delete()

        assert Scaffold.count() == 0
        assert Scaffold.get(scaffold.id) == null
        assert response.redirectedUrl == '/scaffold/list'
    }
}
