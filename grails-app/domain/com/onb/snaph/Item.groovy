package com.onb.snaph

class Item {

	static belongsTo = ['snaphUser': SnaphUser, 'category':Category]
	static hasMany = ['comments': Comment]

	Long itemID
	String itemName
	String image
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
    }

	@Override 
	public String toString() {
		itemName	
	}
}
