// Place your Spring DSL code here
beans = {
	userDetailsService(edu.umn.laccore.tmi.auth.springsecurity.TmiUserDetailsService)
	ldapUserDetailsMapper(edu.umn.laccore.tmi.auth.springsecurity.TmiLdapUserDetailsMapper)
}