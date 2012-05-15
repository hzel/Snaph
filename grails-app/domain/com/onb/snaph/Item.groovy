package com.onb.snaph

class Item {

//	static belongsTo = ['snaphUser': SnaphUser, 'category':Category]
	static belongsTo = ['snaphUser': SnaphUser]
	static hasMany = ['comments': Comment]

//	Long itemID
	String itemName
	byte[] image
	String description
	String price
	Date dateAdded

    static constraints = {
//	snaphUser blank:false, null:false
//	category blank:false, null:false
//	itemId blank:false, null:false
//	itemName blank:false, null:false
//	description blank:false, null:false
//	price blank:false, null:false
//	dateAdded blank:false, null:false
    	image maxSize:1024*1024*10
		}

	@Override 
	public String toString() {
		itemName	
	}
}
