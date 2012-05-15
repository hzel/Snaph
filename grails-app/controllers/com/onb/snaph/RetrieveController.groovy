package com.onb.snaph

import grails.converters.JSON

class RetrieveController {

	String ipAddress = "10.10.5.122"
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
			else
				System.out.println("user id:"+user.id);
			List<Item> itemList = user.items.toList()
			System.out.println("list size:"+itemList.size());
			jsonMap.items = itemList.collect {item ->
				byte[] image = item.image
				System.out.println("item encoded");
				String uri = "http://"+ipAddress+":"+port+"/Snaph/image/"+item.id
				return [name: item.itemName, price: item.price, description: item.description, image:uri]
			}
			
			System.out.println("finished making jsonMap:"+jsonMap.toString());
			response.status = 200
			render(contentType: "text/json") {
				jsonMap
			}
			
			}
		else{
			System.out.println("invalid request. can only accept post");
			}
		}
}
