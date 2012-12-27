package edu.umn.laccore.tmi

import org.springframework.web.multipart.*

class FileResourceController {
    
    def index = { redirect(action:"list",params:params) }
	static transactional = true
	
	def utilsService
	
    def list = {
		def fileResourceInstanceList = []
		def f = new File( utilsService.getUnlinkedImagesDir() )
		if( f.exists() ){
			f.eachFile(){ file->
			if( !file.isDirectory() )
				fileResourceInstanceList.add( file.name )
			}
		}
		def imagelessImages = Image.findAllWhere(filename:null)
        [ fileResourceInstanceList: fileResourceInstanceList,  imagelessImages:imagelessImages ]
    }

    def delete = {
		def filename = params.id.replace('###', '.')
		def file = new File( utilsService.getUnlinkedImagesDir() + File.separatorChar +   filename )
		file.delete()
		flashHelper.info "file ${filename} removed" 
		redirect( action:"list" )
    }

	def upload = {
		if ( request?.multiFileMap?.size() > 0 )
		{	
			List<MultipartFile> files = request?.multiFileMap?.collect { it.value }.flatten()
			
			// remove duplicate files - "spaceship" comparison operator (<=>) returns an
			// integer (not a boolean), which the unique() method requires
			files = files.unique { a, b -> a.getOriginalFilename() <=> b.getOriginalFilename() } 
			
			files.each { f ->
				if (f.getOriginalFilename().length() > 0)
				{
					if (!f.empty) {
						flashHelper.info(f.getOriginalFilename() + " uploaded" )
						File dir = new File( utilsService.getUnlinkedImagesDir() )
						if ( !dir.exists() )  {
							Process p = Runtime.runtime.exec("/bin/mkdir -m g+rwxs,o= " + dir.path)//mkdir -m 2770
						}
						File destinationFile = new File( utilsService.getUnlinkedImagesDir() + File.separatorChar + f.getOriginalFilename() )
						f.transferTo( destinationFile )
						PermissionSetter.assignReadWriteToContents(dir)							             			     	
					}    
				    else {
					   flashHelper.warning "empty"
					   println "empty"
				    }
				}
			}
		}
	}
}