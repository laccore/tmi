package edu.umn.laccore.tmi

abstract class UserScopeableController {

    def springSecurityService
	
	protected User getCurrentUser() {
		def principal = springSecurityService?.principal
		log.debug principal?.class?.name	//string if anonymous, org.springframework.security.ldap.userdetails.LdapUserDetailsImpl if LDAP authenticated, 
		String username = null
		if (!principal) {
			username = "no SpringSecurityService"
		} else if (principal instanceof String) {
			//anonymous user if principal not null
			username = principal
		} else {
			username = principal?.username
		}
		log.debug username
		User.findByUsername(username)
	}
}
