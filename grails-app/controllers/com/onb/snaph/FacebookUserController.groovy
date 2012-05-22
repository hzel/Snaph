package com.onb.snaph

import org.springframework.dao.DataIntegrityViolationException

class FacebookUserController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [facebookUserInstanceList: FacebookUser.list(params), facebookUserInstanceTotal: FacebookUser.count()]
    }

    def create() {
        [facebookUserInstance: new FacebookUser(params)]
    }

    def save() {
        def facebookUserInstance = new FacebookUser(params)
        if (!facebookUserInstance.save(flush: true)) {
            render(view: "create", model: [facebookUserInstance: facebookUserInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'facebookUser.label', default: 'FacebookUser'), facebookUserInstance.id])
        redirect(action: "show", id: facebookUserInstance.id)
    }

    def show() {
        def facebookUserInstance = FacebookUser.get(params.id)
        if (!facebookUserInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'facebookUser.label', default: 'FacebookUser'), params.id])
            redirect(action: "list")
            return
        }

        [facebookUserInstance: facebookUserInstance]
    }

    def edit() {
        def facebookUserInstance = FacebookUser.get(params.id)
        if (!facebookUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'facebookUser.label', default: 'FacebookUser'), params.id])
            redirect(action: "list")
            return
        }

        [facebookUserInstance: facebookUserInstance]
    }

    def update() {
        def facebookUserInstance = FacebookUser.get(params.id)
        if (!facebookUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'facebookUser.label', default: 'FacebookUser'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (facebookUserInstance.version > version) {
                facebookUserInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'facebookUser.label', default: 'FacebookUser')] as Object[],
                          "Another user has updated this FacebookUser while you were editing")
                render(view: "edit", model: [facebookUserInstance: facebookUserInstance])
                return
            }
        }

        facebookUserInstance.properties = params

        if (!facebookUserInstance.save(flush: true)) {
            render(view: "edit", model: [facebookUserInstance: facebookUserInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'facebookUser.label', default: 'FacebookUser'), facebookUserInstance.id])
        redirect(action: "show", id: facebookUserInstance.id)
    }

    def delete() {
        def facebookUserInstance = FacebookUser.get(params.id)
        if (!facebookUserInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'facebookUser.label', default: 'FacebookUser'), params.id])
            redirect(action: "list")
            return
        }

        try {
            facebookUserInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'facebookUser.label', default: 'FacebookUser'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'facebookUser.label', default: 'FacebookUser'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
