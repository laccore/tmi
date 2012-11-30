package edu.umn.laccore.tmi

class PermissionSetter {
	
	//static assignOwnerGroupFullToDir(dir) {
	//	println dir.path
	//	Runtime.runtime.exec("chmod 760 " + dir.path)
	//}
	
	static assignReadWriteToFile(file) {
		//println file.path
		Runtime.runtime.exec("chmod 660 " + file.path)
	}
	
	static assignReadWriteToContents(dir) {
		dir.listFiles().each { file -> 
			PermissionSetter.assignReadWriteToFile(file)
		}
	}

}
