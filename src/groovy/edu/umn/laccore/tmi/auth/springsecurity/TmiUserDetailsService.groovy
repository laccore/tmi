package edu.umn.laccore.tmi.auth.springsecurity

import org.springframework.security.core.authority.GrantedAuthorityImpl
import org.springframework.security.core.userdetails.UserDetails
import org.springframework.security.core.userdetails.UsernameNotFoundException


import edu.umn.laccore.tmi.User
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import org.codehaus.groovy.grails.plugins.springsecurity.GrailsUserDetailsService


class TmiUserDetailsService implements GrailsUserDetailsService {
	/** 
	 * Some Spring Security classes (e.g. RoleHierarchyVoter) expect at least 
	 * one role, so we give a user with no granted roles this one which gets 
	 * past that restriction but doesn't grant anything. 
	 */ 
	private static final List NO_ROLES = [new GrantedAuthorityImpl(SpringSecurityUtils.NO_ROLE)]
	
	UserDetails loadUserByUsername(String username, boolean loadRoles) throws UsernameNotFoundException { 
		return loadUserByUsername(username) 
	}
	
	UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		def irbProtocols
		def fullName
		
		User.withTransaction { status ->
			User user = User.findByUsername(username) 
			if (!user) throw new UsernameNotFoundException( 'User not found', username)
	
			def authorities = user.authorities.collect { new GrantedAuthorityImpl(it.authority) }
			log.debug "Local db user found (${username})"
	
			return new TmiUserDetails(user.username, user.password, user.enabled, 
				!user.accountExpired, !user.passwordExpired, 
				!user.accountLocked, 
				authorities ?: NO_ROLES, 
				user.id) 
		} 
	}
}
	


