package com.onb.snaph



import org.junit.*
import grails.test.mixin.*

@TestFor(SnaphUserController)
@Mock(SnaphUser)
class SnaphUserControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/snaphUser/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.snaphUserInstanceList.size() == 0
        assert model.snaphUserInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.snaphUserInstance != null
    }

    void testSave() {
        controller.save()

        assert model.snaphUserInstance != null
        assert view == '/snaphUser/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/snaphUser/show/1'
        assert controller.flash.message != null
        assert SnaphUser.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/snaphUser/list'


        populateValidParams(params)
        def snaphUser = new SnaphUser(params)

        assert snaphUser.save() != null

        params.id = snaphUser.id

        def model = controller.show()

        assert model.snaphUserInstance == snaphUser
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/snaphUser/list'


        populateValidParams(params)
        def snaphUser = new SnaphUser(params)

        assert snaphUser.save() != null

        params.id = snaphUser.id

        def model = controller.edit()

        assert model.snaphUserInstance == snaphUser
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/snaphUser/list'

        response.reset()


        populateValidParams(params)
        def snaphUser = new SnaphUser(params)

        assert snaphUser.save() != null

        // test invalid parameters in update
        params.id = snaphUser.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/snaphUser/edit"
        assert model.snaphUserInstance != null

        snaphUser.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/snaphUser/show/$snaphUser.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        snaphUser.clearErrors()

        populateValidParams(params)
        params.id = snaphUser.id
        params.version = -1
        controller.update()

        assert view == "/snaphUser/edit"
        assert model.snaphUserInstance != null
        assert model.snaphUserInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/snaphUser/list'

        response.reset()

        populateValidParams(params)
        def snaphUser = new SnaphUser(params)

        assert snaphUser.save() != null
        assert SnaphUser.count() == 1

        params.id = snaphUser.id

        controller.delete()

        assert SnaphUser.count() == 0
        assert SnaphUser.get(snaphUser.id) == null
        assert response.redirectedUrl == '/snaphUser/list'
    }
}
