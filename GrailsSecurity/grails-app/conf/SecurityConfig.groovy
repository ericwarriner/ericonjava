security {

	// see DefaultSecurityConfig.groovy for all settable/overridable properties

	active = true

	loginUserDomainClass = "Person"
	authorityDomainClass = "Authority"
	requestMapClass = "Requestmap"

    environments {
    production {
        security.useMail = true
    }
    development {
        security.useMail = true
    }

    mailHost = 'smtp.gmail.com'
    mailUsername = '*******'
    mailPassword = '********'
    mailFrom = '*******'
    mailPort = 465
    javaMailProperties = ['mail.smtp.auth': 'true',
            'mail.smtp.starttls.enable': 'true',
            'mail.smtp.socketFactory.port': 465,
            'mail.smtp.socketFactory.class': 'javax.net.ssl.SSLSocketFactory',
            'mail.smtp.socketFactory.fallback': 'false',
            'mail.debug': 'false']
}



}
