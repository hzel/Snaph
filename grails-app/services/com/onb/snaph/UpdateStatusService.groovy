package com.onb.snaph

import org.springframework.social.facebook.api.Facebook
import org.springframework.social.facebook.api.FacebookLink
import org.springframework.social.facebook.api.impl.FacebookTemplate

class UpdateStatusService {

	String ipAddress = "10.10.6.127"
	String port = "8080"
	
    def updateStatus(User user, def id) {
		def username = user?.getUsername()
		def uid = username.substring(username.indexOf("_") + 1)
		
		String accessToken = FacebookUser.findByUid(uid).accessToken
		Facebook facebook = new FacebookTemplate(accessToken)
		
//		List<Item> itemList = user.items.toList()
		def itemInstance = Item.findById(id)
		FacebookLink link = new FacebookLink("http://"+ipAddress+":"+port+"/Snaph/item_profile/"+id, itemInstance.getItemName() , "Sna.ph", itemInstance.getDescription())
			facebook.feedOperations().postLink("This is not a virus!. Check out this thing I saw on sna.ph!", link)
			
//		FacebookLink link = new FacebookLink("http://www.springsource.org/spring-social",
//			"Spring Social",
//			"The Spring Social Project",
//			"Spring Social is an extension to Spring to enable applications to connect with service providers.")
//			facebook.feedOperations().postLink('hello', link)
		return link
    }
}
