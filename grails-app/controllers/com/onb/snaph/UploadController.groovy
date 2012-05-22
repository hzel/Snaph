package com.onb.snaph

import grails.converters.XML
import java.text.DateFormat
import java.text.SimpleDateFormat
import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile;

class UploadController {

	def index() { }

	def uploadData(){
		if(request.method == "POST"){
			if(request instanceof MultipartHttpServletRequest){
				MultipartHttpServletRequest mpr = (MultipartHttpServletRequest)request;
				switch(params.command){
					case "insert":
						insertItem(params)
						break
					case "delete":
						deleteItem(params)
						break
					case "edit":
						editItem(params)
						break
					default:
						response.status = 404 //Internal Server Error
						render "Invalid command."
						break
				}
			}
			else{
				System.out.println("request is not of type MultipartHttpServletRequest\n")

			}
		}
		else{
			System.out.println("invalid request. can only accept post");
		}
	}

	def insertItem = { params ->
		String token = params.facebookToken
		String userId = params.facebookUserId
		String name = params.name
		def imageFile = params.image
		byte[] image = imageFile.getBytes()
		String desc = params.description
		String price = params.price

		Item newItem = new Item()
		newItem.itemName  = name
		newItem.image = image
		newItem.description = desc
		newItem.price = price
		//				newItem.category = Category.findByCategory("Electronics")
		SnaphUser user = SnaphUser.findByFacebookID(userId)
//		FacebookUser facebookUser = FacebookUser.findByUid(Long.parseLong(userId))

		//				if user is not in database, make a new user
		if(user == null){
			user = new SnaphUser()
			user.facebookID = userId
			user.username = "facebook_" + userId
			user.password = "password"
			user.enabled = true
			user.save(flush: true)
			FacebookUser facebookUser = new FacebookUser(uid: Long.parseLong(userId), accessToken: token)
			facebookUser.save()
		}
//		if (facebookUser == null){
//			facebookUser = new FacebookUser(uid: Long.parseLong(userId), accessToken: token)
//		}
//		else{
//			facebookUser.setAccessToken(token)
//			}
		newItem.snaphUser = user
		newItem.comments = null

		DateFormat dateFormat = new SimpleDateFormat("MMMMM dd yyyy")
		Date date = new Date()
		newItem.dateAdded = dateFormat.parse(dateFormat.format(date))

		if(newItem.save(flush: true)){
			response.status = 201 // Created
			System.out.println "name:"+ name + " image:"+ imageFile + " desc:"+ desc + " price:"+ price +" userId:"+userId+" dateAdded:"+newItem.dateAdded+"\n"
			render "saved item uploaded with name:"+ name+" image:"+ imageFile+" desc:"+ desc+" price:"+ price + " userId:"+userId+" dateAdded:"+newItem.dateAdded+"\n"
		}
		else{
			response.status = 500 //Internal Server Error
			render "Could not create new item due to errors:\n ${newItem.errors}"
		}
	}

	def editItem = { params ->
		def itemId = params.itemId
		def userId = params.facebookUserId
		def itemInstance = Item.findById(itemId)
		if(itemInstance == null){
			response.status = 404	//Unauthorized
			render "Could not edit item "+itemId+" because it does not exist."
			return
		}
		def itemOwner = itemInstance.snaphUser
		if(itemOwner.facebookID == userId){
			itemInstance.itemName = params.name
			itemInstance.price = params.price
			itemInstance.description = params.description
			def imageFile = params.image
			byte[] image = imageFile.getBytes()
			itemInstance.image = image
			if(itemInstance.save(flush: true)){
				response.status = 200 // OK
				System.out.println "name:"+ itemInstance.itemName + " image:"+ imageFile + " desc:"+ itemInstance.description + " price:"+ itemInstance.price +" userId:"+userId+" dateAdded:"+itemInstance.dateAdded+"\n"
				render "edited item "+itemInstance.id+" name:"+itemInstance.itemName + " image:"+ imageFile + " desc:"+ itemInstance.description + " price:"+ itemInstance.price +" userId:"+userId+" dateAdded:"+itemInstance.dateAdded+"\n"
			}
			else{
				response.status = 500 //Internal Server Error
				render "Could not create new item due to errors:\n ${itemInstance.errors}"
			}
		}
		else{
			response.status = 401	//Unauthorized
			render "Could not edit item " + itemId + ". Proper authority needed."
		}
	}

	def deleteItem = { params ->
		def itemId = params.itemId
		def userId = params.facebookUserId
		def itemInstance = Item.findById(itemId)
		println("id:"+userId)
		if(itemInstance == null){
			response.status = 404	//Unauthorized
			render "Could not delete item "+ itemId +" because it does not exist."
			return
		}
		def itemOwner = itemInstance.snaphUser
		if(itemOwner.facebookID == userId){
			itemInstance.delete()
			response.status = 200 // OK
			System.out.println "item " + itemId + " was deleted\n"
			render "item "+ itemId + " was deleted\n"
		}
		else{
			response.status = 401	//Unauthorized
			render "Could not delete item "+itemId+". Proper authority needed."
		}
	}
}