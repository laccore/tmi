package edu.umn.laccore.tmi

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN', 'IS_AUTHENTICATED_FULLY'])
class FaqController {

    static scaffold = true
	
	def index = {
		redirect(action: "list", params: params)
	}

	@Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
	def all = {
		[faqInstanceList: Faq.list(params)]
	}

}