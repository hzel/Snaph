package com.onb.snaph



import org.junit.*
import grails.test.mixin.*

@TestFor(FacebookUserController)
@Mock(FacebookUser)
class FacebookUserControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/facebookUser/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.facebookUserInstanceList.size() == 0
        assert model.facebookUserInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.facebookUserInstance != null
    }

    void testSave() {
        controller.save()

        assert model.facebookUserInstance != null
        assert view == '/facebookUser/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/facebookUser/show/1'
        assert controller.flash.message != null
        assert FacebookUser.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/facebookUser/list'


        populateValidParams(params)
        def facebookUser = new FacebookUser(params)

        assert facebookUser.save() != null

        params.id = facebookUser.id

        def model = controller.show()

        assert model.facebookUserInstance == facebookUser
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/facebookUser/list'


        populateValidParams(params)
        def facebookUser = new FacebookUser(params)

        assert facebookUser.save() != null

        params.id = facebookUser.id

        def model = controller.edit()

        assert model.facebookUserInstance == facebookUser
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/facebookUser/list'

        response.reset()


        populateValidParams(params)
        def facebookUser = new FacebookUser(params)

        assert facebookUser.save() != null

        // test invalid parameters in update
        params.id = facebookUser.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/facebookUser/edit"
        assert model.facebookUserInstance != null

        facebookUser.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/facebookUser/show/$facebookUser.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        facebookUser.clearErrors()

        populateValidParams(params)
        params.id = facebookUser.id
        params.version = -1
        controller.update()

        assert view == "/facebookUser/edit"
        assert model.facebookUserInstance != null
        assert model.facebookUserInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/facebookUser/list'

        response.reset()

        populateValidParams(params)
        def facebookUser = new FacebookUser(params)

        assert facebookUser.save() != null
        assert FacebookUser.count() == 1

        params.id = facebookUser.id

        controller.delete()

        assert FacebookUser.count() == 0
        assert FacebookUser.get(facebookUser.id) == null
        assert response.redirectedUrl == '/facebookUser/list'
    }
}
