import com.onb.snaph.*

class BootStrap {

    def init = { servletContext ->
	def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
      def userRole = new Role(authority: 'ROLE_USER').save(flush: true)

      def snaphUser1 = new SnaphUser(username: 'blessie', enabled: true, password: 'blessie', facebookID: '100000081560972')
      snaphUser1.save(flush: true)

      def snaphUser2 = new SnaphUser(username: 'hazel', enabled: true, password: 'hazel', facebookID: '566924412')
      snaphUser2.save(flush: true)

      def snaphUser3 = new SnaphUser(username: 'giselle', enabled: true, password: 'giselle', facebookID: '521537572')
      snaphUser3.save(flush: true)
	  
	  def snaphUser4 = new SnaphUser(username: 'dummy', enabled: true, password: 'dummy', facebookID: '100003804984482')
	  snaphUser4.save(flush: true)
      
      UserRole.create snaphUser1, adminRole, true
	UserRole.create snaphUser2, userRole, true
	UserRole.create snaphUser3, userRole, true
	UserRole.create snaphUser4, userRole, true

      assert User.count() == 4
      assert Role.count() == 2
      assert UserRole.count() == 4

//	def electronics = new Category(category: 'Electronics').save(flush: true)
//	def fashion = new Category(category: 'Fashion').save(flush: true)
//	def toys = new Category(category: 'Toys').save(flush: true)
//	def laptops = new Category(category: 'Laptops').save(flush: true)
//	def console = new Category(category: 'Console').save(flush: true)
//	
//	assert Category.count == 5

    }
    def destroy = {
    }
}
