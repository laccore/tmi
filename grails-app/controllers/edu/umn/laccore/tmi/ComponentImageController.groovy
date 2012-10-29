package edu.umn.laccore.tmi

import javax.servlet.ServletContext
import javax.servlet.ServletOutputStream
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse


class ComponentImageController {
	
    def index = { 
		//def resourceRealPath
		println "\n\nforwardURI:"+request.forwardURI
		def modifiedForwardURI = request.forwardURI.replaceFirst(request.contextPath+"/components","")
		println "modified forwardURI: "+modifiedForwardURI
		//String containerRelativePath = modifiedForwardURI.replaceFirst("/","")
		//def resourcePath = servletContext.getRealPath("/")+grailsApplication.config.images.parent.location + modifiedForwardURI
		def resourcePath = (grailsApplication.config.images.location.isRelative)?servletContext.getRealPath("/"):"" + grailsApplication.config.images.parent.location + modifiedForwardURI
		
		//println "containerRelativePath:"+containerRelativePath
		println "resourcePath:"+resourcePath

		ServletContext sc = getServletContext();
		//if (containerResourceExists(containerRelativePath)) {
			// Get the absolute path of the image
			//ServletContext sc = getServletContext();
		//	resourceRealPath = sc.getRealPath(containerRelativePath)
		//} else {
			//assign real path to configured real path
		//	resourceRealPath = externalRealPath
		//}
		
		
		File file = new File(resourcePath);
		if (file.exists()) {
			// Set content size
			response.setContentLength((int)file.length());
			// Get the MIME type of the image
			def mimeType = sc.getMimeType(resourcePath);
			println mimeType
			// Set content type
			response.setContentType(mimeType);
		} else {
			println "resource does not exist: "+resourcePath
			response.setStatus(HttpServletResponse.SC_NOT_FOUND)
			return
		}
	
		
	
		// Open the file and output streams
		FileInputStream ins = new FileInputStream(file);
		OutputStream out = response.getOutputStream();
	
		// Copy the contents of the file to the output stream
		byte[] buf = new byte[1024];
		int count = 0;
		while ((count = ins.read(buf)) >= 0) {
			out.write(buf, 0, count);
		}
		ins.close();
		out.close();
		
		/*HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse res = (HttpServletResponse)response;
		byte[] ba = getImageBytes(); //implement a method to read the image bytes
		ServletOutputStream sos = res.getOutputStream();		
		res.setContentType("image/jpeg"); //give the corresponding image type.	
		res.setContentLength(ba.length);	
		sos.write(ba);*/	
    }
}

//The same technique could be used to stream other types of binary files, such as PDFs or blobs from a database. 
//This example uses ServletContext.getResourceAsStream to pull the file from within the webapp. 
//If you wanted to stream a file from the filesystem that isn't within your webapp, look at java.io.File. 