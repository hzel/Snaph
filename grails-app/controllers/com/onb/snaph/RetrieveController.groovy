package com.onb.snaph

import java.net.*
import grails.converters.JSON

class RetrieveController {

	//	String ipAddress = java.net.InetAddress.getLocalHost().getHostAddress()
	String ipAddress = "10.10.5.51"
	String port = "8080"

	def index() { }

	def retrieveData(){
		if(request.method == "POST"){
			HashMap jsonMap = new HashMap()
			System.out.println("token:"+params.token)
			String token = params.token
			SnaphUser user = SnaphUser.findByFacebookID(token)
			if(user == null){
				System.out.println("user not found!");
			}
			System.out.println("retrieving data for userId:"+user.id);
			List<Item> itemList = user.items.toList()
			System.out.println("list size:"+itemList.size());
			jsonMap.items = itemList.collect {item ->
				byte[] image = item.image
				String uri = "http://"+ipAddress+":"+port+"/Snaph/image/"+item.id
				String itemURL = "http://"+ipAddress+":"+port+"/Snaph/item_profile/"+item.id
				return [name: item.itemName, price: item.price, description: item.description, image:uri, itemId:item.id, itemUrl:itemURL ]
			}

			response.status = 200
			render(contentType: "text/json") {
				jsonMap
			}
			System.out.println("finished making jsonMap:"+jsonMap.toString());
			
		}
		else{
			System.out.println("invalid request. can only accept post");
		}
	}
}
