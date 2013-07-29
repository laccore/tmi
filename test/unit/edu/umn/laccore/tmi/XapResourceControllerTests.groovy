package edu.umn.laccore.tmi



import org.junit.*
import grails.test.mixin.*

@TestFor(XapResourceController)
@Mock(XapResource)
class XapResourceControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/xapResource/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.xapResourceInstanceList.size() == 0
        assert model.xapResourceInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.xapResourceInstance != null
    }

    void testSave() {
        controller.save()

        assert model.xapResourceInstance != null
        assert view == '/xapResource/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/xapResource/show/1'
        assert controller.flash.message != null
        assert XapResource.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/xapResource/list'

        populateValidParams(params)
        def xapResource = new XapResource(params)

        assert xapResource.save() != null

        params.id = xapResource.id

        def model = controller.show()

        assert model.xapResourceInstance == xapResource
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/xapResource/list'

        populateValidParams(params)
        def xapResource = new XapResource(params)

        assert xapResource.save() != null

        params.id = xapResource.id

        def model = controller.edit()

        assert model.xapResourceInstance == xapResource
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/xapResource/list'

        response.reset()

        populateValidParams(params)
        def xapResource = new XapResource(params)

        assert xapResource.save() != null

        // test invalid parameters in update
        params.id = xapResource.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/xapResource/edit"
        assert model.xapResourceInstance != null

        xapResource.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/xapResource/show/$xapResource.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        xapResource.clearErrors()

        populateValidParams(params)
        params.id = xapResource.id
        params.version = -1
        controller.update()

        assert view == "/xapResource/edit"
        assert model.xapResourceInstance != null
        assert model.xapResourceInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/xapResource/list'

        response.reset()

        populateValidParams(params)
        def xapResource = new XapResource(params)

        assert xapResource.save() != null
        assert XapResource.count() == 1

        params.id = xapResource.id

        controller.delete()

        assert XapResource.count() == 0
        assert XapResource.get(xapResource.id) == null
        assert response.redirectedUrl == '/xapResource/list'
    }
}
