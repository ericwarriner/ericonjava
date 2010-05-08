import com.test.Role
import com.test.User
import com.test.UserRole
class BootStrap {
   def springSecurityService
   def init = { servletContext ->
      def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
      def userRole = new Role(authority: 'ROLE_USER').save(flush: true)
String password = springSecurityService.encodePassword('password')
      def testUser = new User(username: 'me', enabled: true, password: password)
      testUser.save(flush: true)
      UserRole.create testUser, adminRole, true
      assert User.count() == 1
      assert Role.count() == 2
      assert UserRole.count() == 1
   }
}