package edu.umn.laccore.tmi

class Edge {

    static constraints = {
		description(blank:true)
		sourceNode()
		targetNode(nullable:true)
		imageName(nullable:true,unique:true)
    }
	
	Node sourceNode
	Node targetNode
	
	String description
	String imageName
	
	
	String toString() {
		if (description != null) {
			"Edge: ${description}"
		} else {
			"sourceNode: ${sourceNode}"
		}
	}
}
