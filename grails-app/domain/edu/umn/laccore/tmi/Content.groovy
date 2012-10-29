package edu.umn.laccore.tmi

class Content {

    static constraints = {
		grailsController(blank:false)
		grailsAction(blank:false)
		displayOrder(blank:true, nullable:true)
		content(blank:false, widget:"textarea")
    }
	
	String grailsController
	String grailsAction
	Integer displayOrder
	String content
	
	static mapping = {
	}
	
	public String toString() {
		return (new GroovyShell ( ) ).evaluate ( '"""' + content + '"""')
	}

}
