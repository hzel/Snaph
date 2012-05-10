package com.onb.snaph

import org.springframework.dao.DataIntegrityViolationException

class SnaphUserController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [snaphUserInstanceList: SnaphUser.list(params), snaphUserInstanceTotal: SnaphUser.count()]
    }

    def create() {
        [snaphUserInstance: new SnaphUser(params)]
    }

    def save() {
        def snaphUserInstance = new SnaphUser(params)
        if (!snaphUserInstance.save(flush: true)) {
            render(view: "create", model: [snaphUserInstance: snaphUserInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'snaphUser.label', default: 'SnaphUser'), snaphUserInstance.id])
        redirect(action: "show", id: snaphUserInstance.id)
    }

    def show() {
        def snaphUserInstance = SnaphUser.get(params.id)
        if (!snaphUserInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'snaphUser.label', default: 'SnaphUser'), params.id])
            redirect(action: "list")
            return
        }

        [snaphUserInstance: snaphUserInstance]
    }

    def edit() {
        def snaphUserInstance = SnaphUser.get(params.id)
        if (!snaphUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'snaphUser.label', default: 'SnaphUser'), params.id])
            redirect(action: "list")
            return
        }

        [snaphUserInstance: snaphUserInstance]
    }

    def update() {
        def snaphUserInstance = SnaphUser.get(params.id)
        if (!snaphUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'snaphUser.label', default: 'SnaphUser'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (snaphUserInstance.version > version) {
                snaphUserInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'snaphUser.label', default: 'SnaphUser')] as Object[],
                          "Another user has updated this SnaphUser while you were editing")
                render(view: "edit", model: [snaphUserInstance: snaphUserInstance])
                return
            }
        }

        snaphUserInstance.properties = params

        if (!snaphUserInstance.save(flush: true)) {
            render(view: "edit", model: [snaphUserInstance: snaphUserInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'snaphUser.label', default: 'SnaphUser'), snaphUserInstance.id])
        redirect(action: "show", id: snaphUserInstance.id)
    }

    def delete() {
        def snaphUserInstance = SnaphUser.get(params.id)
        if (!snaphUserInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'snaphUser.label', default: 'SnaphUser'), params.id])
            redirect(action: "list")
            return
        }

        try {
            snaphUserInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'snaphUser.label', default: 'SnaphUser'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'snaphUser.label', default: 'SnaphUser'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
