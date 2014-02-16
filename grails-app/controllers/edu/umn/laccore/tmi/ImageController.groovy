package edu.umn.laccore.tmi
import grails.plugins.springsecurity.Secured
import groovy.sql.Sql

import java.sql.*

import org.grails.plugins.imagetools.*

import au.com.bytecode.opencsv.*

@Secured(['ROLE_ADMIN', 'IS_AUTHENTICATED_FULLY'])
class ImageController {

	def dataSource
	def utilsService
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]	
	
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
		def componentSpecificDir = new File(utilsService.getImagesDir(), imageInstance.imagesDir())
		if ( !componentSpecificDir.exists() && !componentSpecificDir.parentFile.exists() )  {
			//componentSpecificDir.mkdirs()
			Runtime.runtime.exec("/bin/mkdir -m g+rwxs,o= " + componentSpecificDir.parentFile.path)
			Runtime.runtime.exec("/bin/mkdir -m g+rwxs,o= " + componentSpecificDir.path)
		} else {
			if ( componentSpecificDir.parentFile.exists() && !componentSpecificDir.exists() )  {
				Runtime.runtime.exec("/bin/mkdir -m g+rwxs,o= " + componentSpecificDir.path)
			}
		}
		println "${componentSpecificDir}"
		return componentSpecificDir
    }
	
	/*private saveFileOnImageCreation = { file, imageInstance, imageDir ->
		// Saving uploaded file to disk
		
		file.transferTo(new File(imageDir, file.originalFilename))
		PermissionSetter.assignReadWriteToFile(file)
		imageInstance.filename = file.originalFilename
    }*/
		
	/*
	 * used in process that links images to metadata
	 */
	def moveExistingFile = { file, imageDir -> 
		// Move file to new directory
		if ( file.renameTo(new File(imageDir, file.getName())) )
			PermissionSetter.assignReadWriteToFile(file)
		else
			println "file move FAILED"
    }

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
		def sortBy = params.sort ?: "ui.name"
		def orderBy = params.order ?: "asc"
		print "sort by ${sortBy}, order ${orderBy}"
		def c = Image.createCriteria()
		def results = c.list {
			createAlias("uniqueIdentification", "ui")
			order(sortBy, orderBy)
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
		// uploadedFile is of type org.springframework.web.multipart.commons.CommonsMultipartFile
		def uploadedFile = request.getFile('payload')
		def overlayFile = request.getFile('overlayPayload')
		
		def imageInstance = new Image(params)
		if (!uploadedFile.empty) {
			
			if (!utilsService.isAllowedImageFile(uploadedFile.originalFilename)) {
				flash.message = "Couldn't save ${uploadedFile.originalFilename}, extension must be one of ${utilsService.getAllowedExtensions()}"
				render(view: "create", model: [imageInstance: imageInstance])
				return
			}
		
			// save and process image
			def componentSpecificDir = createDirForImage(imageInstance)
			uploadedFile.transferTo(new File(componentSpecificDir, uploadedFile.originalFilename))
			
			utilsService.createImageThumbnails(uploadedFile.originalFilename, imageInstance, componentSpecificDir)
		}
		
		if (!overlayFile.empty) {
			if (!overlayFile.originalFilename.endsWith('.png')) {
				flash.message = "Annotation Overlay file ${overlayFile.originalFilename} must be a PNG image"
				render(view: "create", model: [imageInstance: imageInstance])
				return
			}
			
			// save overlay
			def componentSpecificDir = createDirForImage(imageInstance)
			overlayFile.transferTo(new File(componentSpecificDir, overlayFile.originalFilename))
			imageInstance.filenameOverlay = overlayFile.originalFilename
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
			//first get the imagesDir for persisted image in case we need to move them if the uid has changed
			def oldImagesDir = imageInstance.imagesDir()
			println oldImagesDir
			
            imageInstance.properties = params
			
			println "about to check"
			if (imageInstance.isDirty('uniqueIdentification')) { //println imageInstance.getDirtyPropertyNames()
				try {
					def newImagesDir = imageInstance.imagesDir()
					//println newImagesDir
					utilsService.moveImages(oldImagesDir,imageInstance)
				} catch (Exception e) {
					e.printStackTrace()
					flash.message = "Problem moving image ${imageInstance.filename} to new location"
					redirect(action: "show", id: imageInstance.id)
					return
				}
			}
			
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
	
	private removeImageFile(imageInstanceDir, filename) {
		def fileOriginal = new File(utilsService.getImagesDir() + "/" + imageInstanceDir, filename)
		if ( fileOriginal.exists() )
			fileOriginal.delete()
	}
	
	private removeImagesFromDisk(imageInstance) {
		imageInstanceDir = imageInstance.imagesDir()
		removeImageFile(imageInstanceDir, imageInstance.filename)
		removeImageFile(imageInstanceDir, imageInstance.filenameMedium)
		removeImageFile(imageInstanceDir, imageInstance, filenameThumb)
		removeImageFile(imageInstanceDir, imageInstance, filenameOverlay)
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
		def javaIoFile = new File(utilsService.getUnlinkedImagesDir() + File.separatorChar +  params.filename)
		
		println "orig image name: " + imageInstance.originalImageName
		println "file to be moved: " + params.filename
		println "fluffed-up file: " + javaIoFile.absolutePath
		def destDir = createDirForImage(imageInstance)
		println "destination dir: " + destDir
		moveExistingFile(javaIoFile, destDir)
		utilsService.createImageThumbnails(javaIoFile.name, imageInstance, destDir)

		if (imageInstance.save(flush: true))
			redirect(view:"list", controller:"fileResource")
	}
}
