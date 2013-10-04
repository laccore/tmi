package edu.umn.laccore.tmi



import org.junit.*
import grails.test.mixin.*

@TestFor(SedimentComponentController)
@Mock(SedimentComponent)
class SedimentComponentControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/sedimentComponent/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.sedimentComponentInstanceList.size() == 0
        assert model.sedimentComponentInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.sedimentComponentInstance != null
    }

    void testSave() {
        controller.save()

        assert model.sedimentComponentInstance != null
        assert view == '/sedimentComponent/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/sedimentComponent/show/1'
        assert controller.flash.message != null
        assert SedimentComponent.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/sedimentComponent/list'

        populateValidParams(params)
        def sedimentComponent = new SedimentComponent(params)

        assert sedimentComponent.save() != null

        params.id = sedimentComponent.id

        def model = controller.show()

        assert model.sedimentComponentInstance == sedimentComponent
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/sedimentComponent/list'

        populateValidParams(params)
        def sedimentComponent = new SedimentComponent(params)

        assert sedimentComponent.save() != null

        params.id = sedimentComponent.id

        def model = controller.edit()

        assert model.sedimentComponentInstance == sedimentComponent
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/sedimentComponent/list'

        response.reset()

        populateValidParams(params)
        def sedimentComponent = new SedimentComponent(params)

        assert sedimentComponent.save() != null

        // test invalid parameters in update
        params.id = sedimentComponent.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/sedimentComponent/edit"
        assert model.sedimentComponentInstance != null

        sedimentComponent.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/sedimentComponent/show/$sedimentComponent.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        sedimentComponent.clearErrors()

        populateValidParams(params)
        params.id = sedimentComponent.id
        params.version = -1
        controller.update()

        assert view == "/sedimentComponent/edit"
        assert model.sedimentComponentInstance != null
        assert model.sedimentComponentInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/sedimentComponent/list'

        response.reset()

        populateValidParams(params)
        def sedimentComponent = new SedimentComponent(params)

        assert sedimentComponent.save() != null
        assert SedimentComponent.count() == 1

        params.id = sedimentComponent.id

        controller.delete()

        assert SedimentComponent.count() == 0
        assert SedimentComponent.get(sedimentComponent.id) == null
        assert response.redirectedUrl == '/sedimentComponent/list'
    }
}
