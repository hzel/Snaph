package com.onb.snaph

class Comment {

	static belongsTo = ['item':Item, 'user':SnaphUser]

	String comment
	Date dateAdded = new Date()

    static constraints = {
    }

	@Override 
	public String toString() {
		comment	
	}
}
