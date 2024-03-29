package com.onb.snaph

import org.springframework.dao.*
import org.springframework.social.facebook.api.FacebookProfile

class CommentController {
	
	def springSecurityService
	def facebookProfileDetailService
	
	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [commentInstanceList: Comment.list(params), commentInstanceTotal: Comment.count()]
    }

    def create() {
        [commentInstance: new Comment(params)]
    }

    def save() {
//		def currentUser = springSecurityService.currentUser
//		SnaphUser user = facebookProfileDetailService.getSnaphUser(currentUser)
        def commentInstance = new Comment()
		commentInstance.comment = params.comment
		commentInstance.user = SnaphUser.get(params.user)
		commentInstance.item = Item.get(params.item)
        if (!commentInstance.save(flush: true)) {
            render(view: "create", model: [commentInstance: commentInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'comment.label', default: 'Comment'), commentInstance.id])
        redirect(controller: "item", action: "show", id: params.item)
    }

    def show() {
        def commentInstance = Comment.get(params.id)
        if (!commentInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'comment.label', default: 'Comment'), params.id])
            redirect(action: "list")
            return
        }
		def name = FacebookProfileDetailService.getFbName(commentInstance.user)
		println "name:"+name
        [commentInstance: commentInstance, name: name]
    }

    def edit() {
        def commentInstance = Comment.get(params.id)
        if (!commentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'comment.label', default: 'Comment'), params.id])
            redirect(action: "list")
            return
        }

        [commentInstance: commentInstance]
    }

    def update() {
        def commentInstance = Comment.get(params.id)
        if (!commentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'comment.label', default: 'Comment'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (commentInstance.version > version) {
                commentInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'comment.label', default: 'Comment')] as Object[],
                          "Another user has updated this Comment while you were editing")
                render(view: "edit", model: [commentInstance: commentInstance])
                return
            }
        }

        commentInstance.properties = params

        if (!commentInstance.save(flush: true)) {
            render(view: "edit", model: [commentInstance: commentInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'comment.label', default: 'Comment'), commentInstance.id])
        redirect(action: "show", id: commentInstance.id)
    }

    def delete() {
        def commentInstance = Comment.get(params.id)
        if (!commentInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'comment.label', default: 'Comment'), params.id])
            redirect(action: "list")
            return
        }

        try {
            commentInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'comment.label', default: 'Comment'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'comment.label', default: 'Comment'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
	
//	def getCommentName(){
//		def commentInstance = Comment.get(params.id)
//		def name = FacebookProfileDetailService.getFbName(commentInstance.user)
//		println "name:"+name
//		return [commenterName: name]
//	}
}
