package edu.umn.laccore.tmi

class CoreFaceAnnotation {
	String name // if nothing else, for internal use to distinguish annotations
	Image image
	int x = 0, y = 0
	int width = 20, height = 20 // (x,y) is the *center* of the image
	
	static belongsTo = [coreFace:CoreFaceImage]

    static constraints = {
		name(blank:false, maxSize:50)
		x(blank:false, maxSize: 5, min:1)
		y(blank:false, maxSize: 5, min:1)
		width(blank:false, maxSize: 5, min:2)
		height(blank:false, maxSize: 5, min:2)
    }
	
	String toString() {	"${name}" }
	String cssStyle() { "left:${this.xcoord()}px;bottom:${this.ycoord()}px;width:${width}px;height:${height}px;" }
	int xcoord() { x - width/2 }
	int ycoord() { y - height/2 }
	
	String popupStyle() { "right:${this.popupx()}px;" }
	
	// adjust x position of popup to avoid drawing large % outside of visible area
	int popupx() {
		int maxWidth = 960;
		def diff = maxWidth - x
		if (diff < maxWidth/2)
			return maxWidth/2 - diff
		else
			return 0
	}
}
