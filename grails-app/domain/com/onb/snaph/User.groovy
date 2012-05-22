package com.onb.snaph

class User {

	transient springSecurityService

	String username
	String password
	String displayName
	boolean enabled 
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	static constraints = {
		username blank: false, unique: true
		password blank: false
		displayName nullable: true
	}

	static mapping = {
		password column: '`password`'
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	@Override
	public String toString() {
		return displayName
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
}
