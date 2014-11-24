package edu.umn.laccore.tmi.auth.springsecurity

import edu.umn.laccore.tmi.User
//import grails.plugins.springsecurity.SpringSecurityUtils
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

import org.springframework.ldap.core.DirContextAdapter
import org.springframework.ldap.core.DirContextOperations
import org.springframework.security.core.GrantedAuthority
import org.springframework.security.core.authority.GrantedAuthorityImpl
//import org.springframework.security.core.authority.SimpleGrantedAuthority//.GrantedAuthorityImpl
import org.springframework.security.core.userdetails.UserDetails
import org.springframework.security.core.userdetails.UsernameNotFoundException
import org.springframework.security.ldap.userdetails.UserDetailsContextMapper

class TmiLdapUserDetailsMapper implements UserDetailsContextMapper  {

	/**
	 * Some Spring Security classes (e.g. RoleHierarchyVoter) expect at least
	 * one role, so we give a user with no granted roles this one which gets
	 * past that restriction but doesn't grant anything.
	 */
	private static final List NO_ROLES = [
		new GrantedAuthorityImpl(SpringSecurityUtils.NO_ROLE)
		//new SimpleGrantedAuthority(SpringSecurityUtils.NO_ROLE)
	]

	UserDetails mapUserFromContext(DirContextOperations ctx,
			String username,
			Collection<GrantedAuthority> authorities) {
			
			User.withTransaction { status ->
				User user = User.findByUsername(username)
				if (!user) throw new UsernameNotFoundException( 'User not found', username)
		
				authorities = user.authorities.collect { new GrantedAuthorityImpl(it.authority) }
				//authorities = user.authorities.collect { new SimpleGrantedAuthority(it.authority) }
				log.debug "LDAP user found (${username})"
		
				return new TmiUserDetails(user.username, user.password, user.enabled,
					!user.accountExpired, !user.passwordExpired,
					!user.accountLocked,
					authorities ?: NO_ROLES,
					user.id)
			}
	}

	void mapUserToContext(UserDetails user, DirContextAdapter ctx) {
		// noop
	}

}
