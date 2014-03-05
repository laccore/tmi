package edu.umn.laccore.tmi



import org.junit.*
import grails.test.mixin.*

@TestFor(CoreFaceAnnotationController)
@Mock(CoreFaceAnnotation)
class CoreFaceAnnotationControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/coreFaceAnnotation/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.coreFaceAnnotationInstanceList.size() == 0
        assert model.coreFaceAnnotationInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.coreFaceAnnotationInstance != null
    }

    void testSave() {
        controller.save()

        assert model.coreFaceAnnotationInstance != null
        assert view == '/coreFaceAnnotation/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/coreFaceAnnotation/show/1'
        assert controller.flash.message != null
        assert CoreFaceAnnotation.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/coreFaceAnnotation/list'

        populateValidParams(params)
        def coreFaceAnnotation = new CoreFaceAnnotation(params)

        assert coreFaceAnnotation.save() != null

        params.id = coreFaceAnnotation.id

        def model = controller.show()

        assert model.coreFaceAnnotationInstance == coreFaceAnnotation
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/coreFaceAnnotation/list'

        populateValidParams(params)
        def coreFaceAnnotation = new CoreFaceAnnotation(params)

        assert coreFaceAnnotation.save() != null

        params.id = coreFaceAnnotation.id

        def model = controller.edit()

        assert model.coreFaceAnnotationInstance == coreFaceAnnotation
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/coreFaceAnnotation/list'

        response.reset()

        populateValidParams(params)
        def coreFaceAnnotation = new CoreFaceAnnotation(params)

        assert coreFaceAnnotation.save() != null

        // test invalid parameters in update
        params.id = coreFaceAnnotation.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/coreFaceAnnotation/edit"
        assert model.coreFaceAnnotationInstance != null

        coreFaceAnnotation.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/coreFaceAnnotation/show/$coreFaceAnnotation.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        coreFaceAnnotation.clearErrors()

        populateValidParams(params)
        params.id = coreFaceAnnotation.id
        params.version = -1
        controller.update()

        assert view == "/coreFaceAnnotation/edit"
        assert model.coreFaceAnnotationInstance != null
        assert model.coreFaceAnnotationInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/coreFaceAnnotation/list'

        response.reset()

        populateValidParams(params)
        def coreFaceAnnotation = new CoreFaceAnnotation(params)

        assert coreFaceAnnotation.save() != null
        assert CoreFaceAnnotation.count() == 1

        params.id = coreFaceAnnotation.id

        controller.delete()

        assert CoreFaceAnnotation.count() == 0
        assert CoreFaceAnnotation.get(coreFaceAnnotation.id) == null
        assert response.redirectedUrl == '/coreFaceAnnotation/list'
    }
}
