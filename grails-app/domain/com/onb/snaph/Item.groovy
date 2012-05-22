package com.onb.snaph

class Item {
	
	static belongsTo = ['snaphUser': SnaphUser]
	static hasMany = ['comments': Comment]

	String itemName
	byte[] image
	String description
	String price
	Date dateAdded

    static constraints = {
    	image maxSize:1024*1024*10
	}

	static mapping = {
		comments sort: 'id', order: 'desc'
	}
	
	@Override 
	public String toString() {
		itemName	
	}
}
