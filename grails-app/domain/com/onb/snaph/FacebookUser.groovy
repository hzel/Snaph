package com.onb.snaph

import com.onb.snaph.User
import com.the6hours.grails.springsecurity.facebook.FacebookUserDomain;

class FacebookUser implements FacebookUserDomain{

	long uid
    String accessToken
	String email
	
	static belongsTo = [user: User]

	static constraints = {
		uid unique: true
		email nullable: true, blank: true
	}
}
