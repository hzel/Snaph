package com.onb.snaph

import org.springframework.social.facebook.api.Facebook
import org.springframework.social.facebook.api.FacebookProfile
import org.springframework.social.facebook.api.impl.FacebookTemplate

class FacebookProfileDetailService {

    def getFbProfileDetails(User user) {
		System.out.println("asdas" + user);
		def username = user?.getUsername()
		def uid = username.substring(username.indexOf("_") + 1)
		
		String accessToken = FacebookUser.findByUid(uid).accessToken
		Facebook facebook = new FacebookTemplate(accessToken)
		
		FacebookProfile fbProfile = facebook.userOperations().userProfile
		
		return fbProfile
    }
	
	def getFbName(User user) {
		FacebookProfile fbProfile = getFbProfileDetails(user)
		return fbProfile.name
	}
}
