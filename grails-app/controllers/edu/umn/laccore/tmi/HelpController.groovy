package edu.umn.laccore.tmi

class HelpController {

    //static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "show", params: params)
    }

    def show = {
        
    }

    
}
