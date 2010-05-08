class BootStrap {
     def authenticateService
     def init = { servletContext ->
        //Adding Roles
     def roleAdmin = new Authority(authority:'ROLE_ADMIN', description:'App admin').save()
     def roleUser  = new Authority(authority:'ROLE_USER', description:'App user').save()
        //Adding Users
     def userGod = new Person(username:'god',
        userRealName:'god almighty',
        enabled: true,
        emailShow: true,
        email: 'warrines@netscape.net',
        passwd: authenticateService.encodePassword("god") )

    def userSlave = new Person(username:'slave',
        userRealName:'poor slave',
        enabled: true,
        emailShow: true,
        email: 'slave@grailsapp.com',
        passwd:authenticateService.encodePassword("slave") )

    def secureUserEdit = new Requestmap(url: '/person/edit', configAttribute:'ROLE_ADMIN').save()
    def secureUserSave = new Requestmap(url: '/person/save', configAttribute:'ROLE_ADMIN').save()
    def secureUserCreate = new Requestmap(url: '/person/create', configAttribute:'ROLE_ADMIN,ROLE_USER').save()
    def secureUserList = new Requestmap(url: '/person/list', configAttribute:'ROLE_USER,ROLE_ADMIN').save()
 //   def baseUrl = new Requestmap(url: '/', configAttribute:'ROLE_USER,ROLE_ADMIN').save()
    roleAdmin.addToPeople(userGod)
    roleUser.addToPeople(userGod)
    roleUser.addToPeople(userSlave)
     }

     def destroy = {
     }
}