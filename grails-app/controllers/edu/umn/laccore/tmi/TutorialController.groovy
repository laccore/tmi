package edu.umn.laccore.tmi

class TutorialController {

    //static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def templates = {
		render(view:"template")
    }
	
	def analysis = {
		render(view:"analysis")
	}
	
	def preparation = {
		//String filename = URLDecoder.decode(request.getPathInfo(), "UTF-8");
		File file = new File(grailsApplication.config.training.video)
	
		response.setContentType("video/quicktime")
		response.setContentLength(TutorialController.safeLongToInt(file.length()))
		//response.setHeader("Content-Disposition", "inline; filename=\"" + file.getName() + "\"");
	
		BufferedInputStream input = null
		BufferedOutputStream output = null
	
		try {
			input = new BufferedInputStream(new FileInputStream(file))
			output = new BufferedOutputStream(response.getOutputStream())
	
			byte[] buffer = new byte[8192]
			for (int length = 0; (length = input.read(buffer)) > 0;) {
				output.write(buffer, 0, length)
			}
		} finally {
			if (output != null) try { output.close() } catch (IOException logOrIgnore) {}
			if (input != null) try { input.close() } catch (IOException logOrIgnore) {}
		}
	
	}
	
	static safeLongToInt(long l) {
		int i = (int)l;
		if ((long)i != l) {
			throw new IllegalArgumentException(l + " cannot be cast to int without changing its value.");
		}
		return i;
	}
	

    
}
