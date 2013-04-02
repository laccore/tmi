package edu.umn.laccore.tmi

import org.grails.plugins.imagetools.*

class UtilsService {
	def grailsApplication
	
	def getGrailsApp() { return grailsApplication }
	
	def getImagesDir() {
		if (grailsApplication.config.images.location.isRelative)
			servletContext.getRealPath("/")
		else
			"" + grailsApplication.config.images.parent.location
	}
	
	def getUnlinkedImagesDir() {
		if (grailsApplication.config.images.location.isRelative)
			servletContext.getRealPath("/")
		else
			"" + grailsApplication.config.unlinked.images.location
	}
	
	def getEdgeImagesDir() {
		"" + grailsApplication.config.edge.images.location
	}
	
	def getExampleImagesDir() {
		"" + grailsApplication.config.question.images.location
	}
	
	def createImageThumbnails = { filename, imageInstance, imageDir ->
		imageInstance.filename = filename
		def imageTool = new ImageTool()
		imageTool.load("${imageDir}" + File.separatorChar + "${filename}")
		imageTool.thumbnail(600)
		def resizedName = filename.substring(0, filename.lastIndexOf('.')) + "-600.jpg"
		imageInstance.filenameMedium = resizedName
		def filePath = "${imageDir}" + File.separatorChar + resizedName;
		imageTool.writeResult(filePath, "JPEG")
		PermissionSetter.assignReadWriteToFile( new File(filePath) )
		
		imageTool.thumbnail(200)
		imageTool.swapSource()
		imageTool.square()
		resizedName = filename.substring(0, filename.lastIndexOf('.')) + "-200s.jpg"
		imageInstance.filenameThumb =  resizedName
		filePath = "${imageDir}" + File.separatorChar + resizedName
		imageTool.writeResult(filePath, "JPEG")
		PermissionSetter.assignReadWriteToFile( new File(filePath) )
	}
	
	static allowedExtensions = ["JPG", "JPEG", "GIF", "PNG"]
	static isAllowedImageFile(filename) {
		// The current image processing library handles PNGs with transparency
		// horribly, but that should be very, very unlikely for our purposes.
		def fileExtension = "${filename}".split("\\.")[-1].toUpperCase()
		
		return allowedExtensions.contains(fileExtension)
	}
	
	static getAllowedExtensions() {
		return allowedExtensions
	}
}
