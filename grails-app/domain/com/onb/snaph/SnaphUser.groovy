package com.onb.snaph

class SnaphUser extends User{

	static hasMany = ['items' : Item]
	String facebookID	//(from facebook profile)

    static constraints = {
	facebookID blank:false, null:false
    }
	
	static mapping = {
		items sort: 'id', order: 'desc'
	}
}
