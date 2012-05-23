package com.onb.snaph

import org.springframework.social.facebook.api.Facebook
import org.springframework.social.facebook.api.FacebookProfile
import org.springframework.social.facebook.api.impl.FacebookTemplate

class FacebookDisplayPhotoService {

    def getDisplayPhoto(User user) {

		def username = user?.getUsername()
		def uid = username.substring(username.indexOf("_") + 1)
		
		String accessToken = FacebookUser.findByUid(uid).accessToken
		Facebook facebook = new FacebookTemplate(accessToken)
		def profileImage = facebook.userOperations().userProfileImage
		
		return profileImage
    }
}
