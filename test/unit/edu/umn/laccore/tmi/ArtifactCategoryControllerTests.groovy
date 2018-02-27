package edu.umn.laccore.tmi



import org.junit.*
import grails.test.mixin.*

@TestFor(ArtifactCategoryController)
@Mock(ArtifactCategory)
class ArtifactCategoryControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/artifactCategory/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.artifactCategoryInstanceList.size() == 0
        assert model.artifactCategoryInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.artifactCategoryInstance != null
    }

    void testSave() {
        controller.save()

        assert model.artifactCategoryInstance != null
        assert view == '/artifactCategory/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/artifactCategory/show/1'
        assert controller.flash.message != null
        assert ArtifactCategory.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/artifactCategory/list'

        populateValidParams(params)
        def artifactCategory = new ArtifactCategory(params)

        assert artifactCategory.save() != null

        params.id = artifactCategory.id

        def model = controller.show()

        assert model.artifactCategoryInstance == artifactCategory
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/artifactCategory/list'

        populateValidParams(params)
        def artifactCategory = new ArtifactCategory(params)

        assert artifactCategory.save() != null

        params.id = artifactCategory.id

        def model = controller.edit()

        assert model.artifactCategoryInstance == artifactCategory
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/artifactCategory/list'

        response.reset()

        populateValidParams(params)
        def artifactCategory = new ArtifactCategory(params)

        assert artifactCategory.save() != null

        // test invalid parameters in update
        params.id = artifactCategory.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/artifactCategory/edit"
        assert model.artifactCategoryInstance != null

        artifactCategory.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/artifactCategory/show/$artifactCategory.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        artifactCategory.clearErrors()

        populateValidParams(params)
        params.id = artifactCategory.id
        params.version = -1
        controller.update()

        assert view == "/artifactCategory/edit"
        assert model.artifactCategoryInstance != null
        assert model.artifactCategoryInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/artifactCategory/list'

        response.reset()

        populateValidParams(params)
        def artifactCategory = new ArtifactCategory(params)

        assert artifactCategory.save() != null
        assert ArtifactCategory.count() == 1

        params.id = artifactCategory.id

        controller.delete()

        assert ArtifactCategory.count() == 0
        assert ArtifactCategory.get(artifactCategory.id) == null
        assert response.redirectedUrl == '/artifactCategory/list'
    }
}
