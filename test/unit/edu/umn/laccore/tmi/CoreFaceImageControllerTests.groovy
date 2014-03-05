package edu.umn.laccore.tmi



import org.junit.*
import grails.test.mixin.*

@TestFor(CoreFaceImageController)
@Mock(CoreFaceImage)
class CoreFaceImageControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/coreFaceImage/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.coreFaceImageInstanceList.size() == 0
        assert model.coreFaceImageInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.coreFaceImageInstance != null
    }

    void testSave() {
        controller.save()

        assert model.coreFaceImageInstance != null
        assert view == '/coreFaceImage/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/coreFaceImage/show/1'
        assert controller.flash.message != null
        assert CoreFaceImage.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/coreFaceImage/list'

        populateValidParams(params)
        def coreFaceImage = new CoreFaceImage(params)

        assert coreFaceImage.save() != null

        params.id = coreFaceImage.id

        def model = controller.show()

        assert model.coreFaceImageInstance == coreFaceImage
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/coreFaceImage/list'

        populateValidParams(params)
        def coreFaceImage = new CoreFaceImage(params)

        assert coreFaceImage.save() != null

        params.id = coreFaceImage.id

        def model = controller.edit()

        assert model.coreFaceImageInstance == coreFaceImage
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/coreFaceImage/list'

        response.reset()

        populateValidParams(params)
        def coreFaceImage = new CoreFaceImage(params)

        assert coreFaceImage.save() != null

        // test invalid parameters in update
        params.id = coreFaceImage.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/coreFaceImage/edit"
        assert model.coreFaceImageInstance != null

        coreFaceImage.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/coreFaceImage/show/$coreFaceImage.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        coreFaceImage.clearErrors()

        populateValidParams(params)
        params.id = coreFaceImage.id
        params.version = -1
        controller.update()

        assert view == "/coreFaceImage/edit"
        assert model.coreFaceImageInstance != null
        assert model.coreFaceImageInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/coreFaceImage/list'

        response.reset()

        populateValidParams(params)
        def coreFaceImage = new CoreFaceImage(params)

        assert coreFaceImage.save() != null
        assert CoreFaceImage.count() == 1

        params.id = coreFaceImage.id

        controller.delete()

        assert CoreFaceImage.count() == 0
        assert CoreFaceImage.get(coreFaceImage.id) == null
        assert response.redirectedUrl == '/coreFaceImage/list'
    }
}
