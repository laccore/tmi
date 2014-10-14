package edu.umn.laccore.tmi

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN', 'IS_AUTHENTICATED_FULLY'])
class SmearSlideComponentController {
	// intentionally empty - SmearSlideComponents are managed through SmearSlide's views and controller
}
