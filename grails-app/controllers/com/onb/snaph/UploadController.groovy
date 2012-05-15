package com.onb.snaph


//import org.apache.hadoop.hbase.util.Bytes

import grails.converters.XML
import java.text.DateFormat
import java.text.SimpleDateFormat
import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile;

class UploadController {

	def index() { }

	def uploadData(){
		if(request.method == "POST"){
			System.out.println("posted");
			//			response.status = 200
			//			render "posted"
			//		}
			if(request instanceof MultipartHttpServletRequest){
				MultipartHttpServletRequest mpr = (MultipartHttpServletRequest)request;

				String token = params.token
				String name = params.name
				//				def image1 = params.image
				//				System.out.println("your image type is:"+image1)
				def imageFile = params.image
				byte[] image = imageFile.getBytes()
//				System.out.println("image string:"+new String(image));
//				System.out.println("image uri:"+new URI( Bytes.toString(image)));
				String desc = params.description
				String price = params.price

				//				store data to database
				Item newItem = new Item()
				newItem.itemName  = name
				newItem.image = image
				newItem.description = desc
				newItem.price = price
//				newItem.category = Category.findByCategory("Electronics")
				SnaphUser user = SnaphUser.findByFacebookID(token)
				//if user is not in database, make a new user
				if(user == null){
					user = new SnaphUser()
					user.facebookID = token
					user.username = "username"
					user.password = "password"
					user.enabled = true 
					user.save(flush: true)
					}
				newItem.snaphUser = user
				newItem.comments = null

				DateFormat dateFormat = new SimpleDateFormat("MMMMM dd yyyy")
				Date date = new Date()
				newItem.dateAdded = dateFormat.parse(dateFormat.format(date))

				if(newItem.save(flush: true)){
					response.status = 200 // Created
					System.out.println "name:"+ name + " image:"+ imageFile + " desc:"+ desc + " price:"+ price +" token:"+token+" dateAdded:"+newItem.dateAdded+"\n"
					render "saved item uploaded with name:"+ name+" image:"+ imageFile+" desc:"+ desc+" price:"+ price + " token:"+token+" dateAdded:"+newItem.dateAdded+"\n"
				}
				else{
					response.status = 500 //Internal Server Error
					render "Could not create new item due to errors:\n ${newItem.errors}"
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
}
