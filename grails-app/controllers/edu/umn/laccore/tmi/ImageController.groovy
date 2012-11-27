package edu.umn.laccore.tmi
import org.grails.plugins.imagetools.*
import grails.plugins.springsecurity.Secured
import org.apache.commons.fileupload.disk.DiskFileItem
import org.apache.commons.fileupload.disk.DiskFileItemFactory
import org.apache.commons.fileupload.FileItem
//import org.springframework.web.multipart.commons.CommonsMultipartFile

@Secured(['ROLE_ADMIN', 'IS_AUTHENTICATED_FULLY'])
class ImageController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	//def IMAGES_DIR = servletContext.getRealPath("/")+grailsApplication.config.images.parent.location
	//def UNASSIGNED_IMAGES_DIR = servletContext.getRealPath("/")+grailsApplication.config.unlinked.images.location
	def IMAGES_DIR = (grailsApplication.config.images.location.isRelative)?servletContext.getRealPath("/"):"" + grailsApplication.config.images.parent.location
	//def UNASSIGNED_IMAGES_DIR = (grailsApplication.config.images.location.isRelative)?servletContext.getRealPath("/"):"" + grailsApplication.config.unlinked.images.location
	def UNASSIGNED_IMAGES_DIR = (grailsApplication.config.images.location.isRelative)?servletContext.getRealPath("/"):"" + grailsApplication.config.unlinked.images.location
	
	def allowedExtensions = ["JPG", "JPEG", "GIF"]
	
	/*def deleteAllImagesYouBetterBeSure = {
		Image.list().each{ imageInstance ->
			imageInstance.delete()//(flush: true)
			removeImagesFromDisk(imageInstance)
		}
		flashHelper.info "All images have been deleted - I hope you meant to do that!"
		redirect(view:"list")
	}*/
	
	private createDirForImage(imageInstance) {
		//def webRootDir = servletContext.getRealPath("/")
		def componentSpecificDir = new File(IMAGES_DIR, imageInstance.imagesDir())
		if ( !componentSpecificDir.exists() && !componentSpecificDir.parentFile.exists() )  {
			//componentSpecificDir.mkdirs()
			Runtime.runtime.exec("/bin/mkdir -m g+rwxs,o= " + componentSpecificDir.parentFile.path)
			Runtime.runtime.exec("/bin/mkdir -m g+rwxs,o= " + componentSpecificDir.path)
		} else {
			if ( componentSpecificDir.parentFile.exists() && !componentSpecificDir.exists() )  {
				//componentSpecificDir.mkdir()
				Runtime.runtime.exec("/bin/mkdir -m g+rwxs,o= " + componentSpecificDir.path)
			}
		}
		//PermissionSetter.assignOwnerGroupFullToDir(componentSpecificDir)
		//PermissionSetter.assignOwnerGroupFullToDir(componentSpecificDir.parentFile)
		println "${componentSpecificDir}"
		return componentSpecificDir
    }
	
	/*private saveFileOnImageCreation = { file, imageInstance, imageDir ->
		// Saving uploaded file to disk
		
		file.transferTo(new File(imageDir, file.originalFilename))
		PermissionSetter.assignReadWriteToFile(file)
		imageInstance.filename = file.originalFilename
    }*/
	
	//assumes org.springframework.web.multipart.commons.CommonsMultipartFile
	def processUploadedImage = { file, imageInstance, imageDir ->
		// Image resizing, etc.
		def imageTool = new ImageTool()
		//imageTool.t
		imageTool.load("${imageDir}" + File.separatorChar + "${file.originalFilename}")
		imageTool.thumbnail(600)
		def resizedName = file.originalFilename.substring(0, file.originalFilename.lastIndexOf('.')) + "-600.jpg"
		imageInstance.filenameMedium = resizedName
		imageTool.writeResult("${imageDir}" + File.separatorChar + resizedName, "JPEG")
		
		imageTool.thumbnail(200)
		imageTool.swapSource()
		imageTool.square()
		resizedName = file.originalFilename.substring(0, file.originalFilename.lastIndexOf('.')) + "-200s.jpg"
		imageInstance.filenameThumb =  resizedName
		imageTool.writeResult("${imageDir}" + File.separatorChar + resizedName, "JPEG")
		PermissionSetter.assignReadWriteToContents(imageDir)
	}
	
	//assumes java.io.File
	def processExistingImage = { file, imageInstance, imageDir ->
		// Image resizing, etc.
		imageInstance.filename = file.name
		def imageTool = new ImageTool()
		imageTool.load("${imageDir}" + File.separatorChar + "${file.name}")
		imageTool.thumbnail(600)
		def resizedName = file.name.substring(0, file.name.lastIndexOf('.')) + "-600.jpg"
		imageInstance.filenameMedium = resizedName
		imageTool.writeResult("${imageDir}" + File.separatorChar + resizedName, "JPEG")
		
		imageTool.thumbnail(200)
		imageTool.swapSource()
		imageTool.square()
		resizedName = file.name.substring(0, file.name.lastIndexOf('.')) + "-200s.jpg"
		imageInstance.filenameThumb =  resizedName
		imageTool.writeResult("${imageDir}" + File.separatorChar + resizedName, "JPEG")
		PermissionSetter.assignReadWriteToContents(imageDir)
	}
	
	def moveExistingFile = { file, destinationDir, imageDir -> 
		// Move file to new directory
		boolean success = file.renameTo(new File(imageDir, file.getName()));
		if (!success) {
			// File was not successfully moved
			println "file move FAILED"
		}
    }

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
		def c = Image.createCriteria()
		def results = c.list {
			createAlias("uniqueIdentification", "ui")
			order("ui.name", "asc")
			//order("id","asc")
		}
        //params.max = Math.min(params.max ? params.int('max') : 50, 100)
        //[imageInstanceList: Image.list(params), imageInstanceTotal: Image.count()]
		//def results = Image.list(sort:"uniqueIdentification.name", order:"asc")
		[imageInstanceList: results, imageInstanceTotal: results.size()]
    }

    def create = {
        def imageInstance = new Image()
        imageInstance.properties = params
        return [imageInstance: imageInstance]
    }

    def save = {
        def imageInstance = new Image(params)
		//def allowedExtensions = ["JPG", "JPEG", "GIF"] // "PNG"
		// The current image processing library handles PNGs with transparency
		// horribly, but that should be very, very unlikely for our purposes.
		
		// File handling
		def uploadedFile = request.getFile('payload')
		
		if(!uploadedFile.empty) {
			def fileExtension = "${uploadedFile.originalFilename}".split("\\.")[-1].toUpperCase()
			
			if (!allowedExtensions.contains(fileExtension)) {
				def extensions = "${allowedExtensions}"
				flash.message = "Filetype extension not in permitted list - ${allowedExtensions}"
				render(view: "create", model: [imageInstance: imageInstance])
				return
			}
		
			// save and process image
			def componentSpecificDir = createDirForImage(imageInstance)
			uploadedFile.transferTo(new File(componentSpecificDir, uploadedFile.originalFilename))
			
			// Image resizing, etc.
			imageInstance.filename = uploadedFile.originalFilename
			def imageTool = new ImageTool()
			imageTool.load("${componentSpecificDir}" + File.separatorChar + "${uploadedFile.originalFilename}")
			imageTool.thumbnail(600)
			def resizedName = uploadedFile.originalFilename.substring(0, uploadedFile.originalFilename.lastIndexOf('.')) + "-600.jpg"
			imageInstance.filenameMedium = resizedName
			imageTool.writeResult("${componentSpecificDir}" + File.separatorChar + resizedName, "JPEG")
			
			imageTool.thumbnail(200)
			imageTool.swapSource()
			imageTool.square()
			resizedName = uploadedFile.originalFilename.substring(0, uploadedFile.originalFilename.lastIndexOf('.')) + "-200s.jpg"
			imageInstance.filenameThumb =  resizedName
			imageTool.writeResult("${componentSpecificDir}" + File.separatorChar + resizedName, "JPEG")
			PermissionSetter.assignReadWriteToContents(componentSpecificDir)
		}
		
        if (imageInstance.save(flush: true)) {
            if (imageInstance.uiTags) imageInstance.parseTags(imageInstance.uiTags, " ")
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'image.label', default: 'Image'), imageInstance.id])}"
            redirect(action: "show", id: imageInstance.id)
        }
        else {
            render(view: "create", model: [imageInstance: imageInstance])
        }
    }

    def show = {
        def imageInstance = Image.get(params.id)
        if (!imageInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'image.label', default: 'Image'), params.id])}"
            redirect(action: "list")
        }
        else {
            [imageInstance: imageInstance]
        }
    }

    def edit = {
        def imageInstance = Image.get(params.id)
        if (!imageInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'image.label', default: 'Image'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [imageInstance: imageInstance]
        }
    }

    def update = {
        def imageInstance = Image.get(params.id)
        if (imageInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (imageInstance.version > version) {
                    
                    imageInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'image.label', default: 'Image')] as Object[], "Another user has updated this Image while you were editing")
                    render(view: "edit", model: [imageInstance: imageInstance])
                    return
                }
            }
            imageInstance.properties = params
			if (imageInstance.uiTags) imageInstance.parseTags(imageInstance.uiTags, " ")
            if (!imageInstance.hasErrors() && imageInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'image.label', default: 'Image'), imageInstance.id])}"
                redirect(action: "show", id: imageInstance.id)
            }
            else {
                render(view: "edit", model: [imageInstance: imageInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'image.label', default: 'Image'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
		def imageInstance = Image.get(params.id)
        if (imageInstance) {
            try {
                imageInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'image.label', default: 'Image'), params.id])}"
				//safe to assume OK to delete associated images
				//def dir = new File(IMAGES_DIR + "/" + imageInstance.imagesDir())
				//println "delete: " + imageInstance.imagesDir()
				//dir.listFiles().each { 
				//	println it.path
				//	it.delete() 
				//}
				removeImagesFromDisk(imageInstance)
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'image.label', default: 'Image'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'image.label', default: 'Image'), params.id])}"
            redirect(action: "list")
        }
    }
	
	private removeImagesFromDisk(imageInstance) {
			//assumes there is an image to delete - should be tightened up
			new File(IMAGES_DIR + "/" + imageInstance.imagesDir(), imageInstance.filename).delete()
			new File(IMAGES_DIR + "/" + imageInstance.imagesDir(), imageInstance.filenameMedium).delete()
			new File(IMAGES_DIR + "/" + imageInstance.imagesDir(), imageInstance.filenameThumb).delete()
	}
	
	def linkImage = {
		//takes uploaded unassigned images and assigns them to a UI instance.
		//params should have the UI.id and unassigned file name
		//method is a lot like a filtered update function except the image instance may or may not exist
		//image information comes in 3 ways:
		//create image action where UI instance is required
		//image metadata from excel sheet (excelUploader)
			//UI instance assigned if it exists
			//UI instance set to Null Component if no UI match is found
		//Image files can be bulk uploaded (fileResource)
		
		//refactor - pass params to ImageService.linkImage()
		def imageInstance = Image.get(params.image.id)
		def javaIoFile = new File(UNASSIGNED_IMAGES_DIR + File.separatorChar +  params.filename)
		
		println "orig image name: " + imageInstance.originalImageName
		println "file to be moved: " + params.filename
		println "fluffed-up file: " + javaIoFile.absolutePath
		def destDir = createDirForImage(imageInstance)
		println "destination dir: " + destDir
		moveExistingFile(javaIoFile,imageInstance,destDir)
		processExistingImage(javaIoFile,imageInstance,destDir)
		if (imageInstance.save(flush: true))
		//PermissionSetter.assignPermissionsPerMSI(new File(grailsApplication.config.images.parent.location))
		redirect(view:"list", controller:"fileResource")
	}
	
}