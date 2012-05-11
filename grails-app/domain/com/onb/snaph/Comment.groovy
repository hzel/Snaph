package com.onb.snaph

class Comment {

	static belongsTo = ['item':Item, 'user':SnaphUser]

	String comment
	Date dateAdded

    static constraints = {
    }

	@Override 
	public String toString() {
		comment	
	}
}
