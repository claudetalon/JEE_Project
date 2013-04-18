package jee_project



import org.junit.*
import grails.test.mixin.*

@TestFor(StudentGroupController)
@Mock(StudentGroup)
class StudentGroupControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/studentGroup/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.studentGroupInstanceList.size() == 0
        assert model.studentGroupInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.studentGroupInstance != null
    }

    void testSave() {
        controller.save()

        assert model.studentGroupInstance != null
        assert view == '/studentGroup/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/studentGroup/show/1'
        assert controller.flash.message != null
        assert StudentGroup.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/studentGroup/list'

        populateValidParams(params)
        def studentGroup = new StudentGroup(params)

        assert studentGroup.save() != null

        params.id = studentGroup.id

        def model = controller.show()

        assert model.studentGroupInstance == studentGroup
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/studentGroup/list'

        populateValidParams(params)
        def studentGroup = new StudentGroup(params)

        assert studentGroup.save() != null

        params.id = studentGroup.id

        def model = controller.edit()

        assert model.studentGroupInstance == studentGroup
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/studentGroup/list'

        response.reset()

        populateValidParams(params)
        def studentGroup = new StudentGroup(params)

        assert studentGroup.save() != null

        // test invalid parameters in update
        params.id = studentGroup.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/studentGroup/edit"
        assert model.studentGroupInstance != null

        studentGroup.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/studentGroup/show/$studentGroup.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        studentGroup.clearErrors()

        populateValidParams(params)
        params.id = studentGroup.id
        params.version = -1
        controller.update()

        assert view == "/studentGroup/edit"
        assert model.studentGroupInstance != null
        assert model.studentGroupInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/studentGroup/list'

        response.reset()

        populateValidParams(params)
        def studentGroup = new StudentGroup(params)

        assert studentGroup.save() != null
        assert StudentGroup.count() == 1

        params.id = studentGroup.id

        controller.delete()

        assert StudentGroup.count() == 0
        assert StudentGroup.get(studentGroup.id) == null
        assert response.redirectedUrl == '/studentGroup/list'
    }
}
