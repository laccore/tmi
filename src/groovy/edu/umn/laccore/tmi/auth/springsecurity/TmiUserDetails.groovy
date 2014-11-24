package edu.umn.laccore.tmi.auth.springsecurity

import org.codehaus.groovy.grails.plugins.springsecurity.GrailsUser
import org.springframework.security.core.GrantedAuthority


class TmiUserDetails extends GrailsUser {

	TmiUserDetails	(String username, 
		 			String password, 
					boolean enabled, 
					boolean accountNonExpired, 
					boolean credentialsNonExpired, 
					boolean accountNonLocked, 
					Collection<GrantedAuthority> authorities,
					long id) { 
		super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities, id)
	}

}
