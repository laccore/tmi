package edu.umn.laccore.tmi

import groovy.json.*

class ModuleController {

    def index = {
		render(view:"overview")
    }
	
	def diatoms = {
		render(view:"diatoms")
	}
	
	def abundance = {
		render(view:"abundance")
	}
	
	def preservation = {
		render(view:"preservation")
    }

    def blog() {
		// 2/27/2013 brg: According to Google (who owns Blogger and probably everything else
		// in the universe by the time someone else reads this comment), the Blogger API key
		// will only expire if we revoke it ourselves through the Google API Console. Thus
		// I'm comfortable hard-coding it here.
		def addr = "https://www.googleapis.com/blogger/v2/blogs/8153395487262690384/posts?key=AIzaSyAXz1Gqzse2gLB63Y7JHP6ISkdiJN_lRTo&fields=items(title,url,selfLink)"
		def url = new URL(addr)
		def slurper = new JsonSlurper()
		def blogList = slurper.parseText("${url.text}") 
		//println blogList
		return [postList: blogList.items]
	}
	
	def blogpost() {
		//mixed content woes https://blog.mozilla.org/tanvi/2013/04/10/mixed-content-blocking-enabled-in-firefox-23/
		render(view:"blogpost")
	}
	
	def test() {}
}
