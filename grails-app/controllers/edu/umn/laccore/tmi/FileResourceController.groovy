package edu.umn.laccore.tmi

class FileResourceController {
    
    def index = { redirect(action:list,params:params) }
	static transactional = true
	
	//def UNLINKED_IMAGES_DIR = servletContext.getRealPath("/")+grailsApplication.config.unlinked.images.location
	def UNLINKED_IMAGES_DIR = (grailsApplication.config.images.location.isRelative)?servletContext.getRealPath("/"):"" + grailsApplication.config.unlinked.images.location
    
    def allowedMethods = []

    def list = {
		def fileResourceInstanceList = []
		def f = new File( UNLINKED_IMAGES_DIR )
		if( f.exists() ){
			f.eachFile(){ file->
			if( !file.isDirectory() )
				fileResourceInstanceList.add( file.name )
			}
		}
		//def nullComponent = UniqueIdentification.findByName('Null Component')
		def imagelessImages = Image.findAllWhere(filename:null)
		println imagelessImages.size()
        [ fileResourceInstanceList: fileResourceInstanceList,  imagelessImages:imagelessImages ]
    }

    def delete = {
		def filename = params.id.replace('###', '.')
		def file = new File( UNLINKED_IMAGES_DIR + File.separatorChar +   filename )
		file.delete()
		flashHelper.info "file ${filename} removed" 
		redirect( action:list )
    }

	def upload = {
		def files = []
		params.fileUpload.each {
			files.add(it.value)
		}

	    files.each { f ->
			if(!f.empty) {
				flashHelper.info(f.getOriginalFilename() + " uploaded" )
				println UNLINKED_IMAGES_DIR
				File dir = new File( UNLINKED_IMAGES_DIR )
				if ( !dir.exists() )  {
					//dir.mkdirs()
					Process p = Runtime.runtime.exec("/bin/mkdir -m g+rwxs,o= " + dir.path)//mkdir -m 2770
					//p.waitFor()
					//PermissionSetter.assignOwnerGroupFullToDir(dir)
				}
				File destinationFile = new File( UNLINKED_IMAGES_DIR + File.separatorChar + f.getOriginalFilename() )
				f.transferTo( destinationFile )
				PermissionSetter.assignReadWriteToContents(dir)							             			     	
			}    
		    else {
			   flashHelper.warning "empty"
			   println "empty"
		    }
	    }
		render(view:"upload")
	}
}