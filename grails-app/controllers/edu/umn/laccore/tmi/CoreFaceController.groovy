package edu.umn.laccore.tmi

class CoreFaceController {

    def index = {
		redirect(action: 'list', params: params)
    }
	
	def list = {
		render(view: 'list', model: [coreFaceImageInstanceList:CoreFaceImage.list()])
	}
}
