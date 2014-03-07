package edu.umn.laccore.tmi



import org.junit.*
import grails.test.mixin.*

@TestFor(DriveSectionController)
@Mock(DriveSection)
class DriveSectionControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/driveSection/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.driveSectionInstanceList.size() == 0
        assert model.driveSectionInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.driveSectionInstance != null
    }

    void testSave() {
        controller.save()

        assert model.driveSectionInstance != null
        assert view == '/driveSection/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/driveSection/show/1'
        assert controller.flash.message != null
        assert DriveSection.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/driveSection/list'

        populateValidParams(params)
        def driveSection = new DriveSection(params)

        assert driveSection.save() != null

        params.id = driveSection.id

        def model = controller.show()

        assert model.driveSectionInstance == driveSection
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/driveSection/list'

        populateValidParams(params)
        def driveSection = new DriveSection(params)

        assert driveSection.save() != null

        params.id = driveSection.id

        def model = controller.edit()

        assert model.driveSectionInstance == driveSection
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/driveSection/list'

        response.reset()

        populateValidParams(params)
        def driveSection = new DriveSection(params)

        assert driveSection.save() != null

        // test invalid parameters in update
        params.id = driveSection.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/driveSection/edit"
        assert model.driveSectionInstance != null

        driveSection.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/driveSection/show/$driveSection.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        driveSection.clearErrors()

        populateValidParams(params)
        params.id = driveSection.id
        params.version = -1
        controller.update()

        assert view == "/driveSection/edit"
        assert model.driveSectionInstance != null
        assert model.driveSectionInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/driveSection/list'

        response.reset()

        populateValidParams(params)
        def driveSection = new DriveSection(params)

        assert driveSection.save() != null
        assert DriveSection.count() == 1

        params.id = driveSection.id

        controller.delete()

        assert DriveSection.count() == 0
        assert DriveSection.get(driveSection.id) == null
        assert response.redirectedUrl == '/driveSection/list'
    }
}
