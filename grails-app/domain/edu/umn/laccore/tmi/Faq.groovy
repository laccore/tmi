package edu.umn.laccore.tmi

class Faq  {

    static constraints = {
		question(widget:'textarea')
		answer(widget:'textarea')
    }
	
	static mapping = {
		question type:'text'
		answer type:'text'
	 }
	
	String question
	String answer
	
	String className() {
		"Faq"
	}
	
	String toString() {
		"${question}"
	}

}
