package springsecuritycore
import grails.plugins.springsecurity.Secured


class SecuredController {

    @Secured(['ROLE_ADMIN'])
   def index = {
      render 'Secure access only'
   }
}