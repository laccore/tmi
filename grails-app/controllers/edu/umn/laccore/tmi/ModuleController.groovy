package edu.umn.laccore.tmi

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

    
}
