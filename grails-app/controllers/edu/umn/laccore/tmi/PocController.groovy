package edu.umn.laccore.tmi

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN'])
class PocController {

	def springSecurityService
	//http://stackoverflow.com/questions/16184049/how-can-i-get-the-user-information-using-spring-security-with-ldap
	def demo() {
		//println authenticatedUser
		println springSecurityService.principal.username
	}
    
}
