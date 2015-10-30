package edu.umn.laccore.tmi

// wait a minute, we already have components in the form of UniqueIdentifications! For now
// we'll proceed with this separate system but may want to combine or associate a component
// with a UI.

// rename to SedimentComponent?
class SmearSlideComponent {
	SedimentComponent component
	int percentage
	boolean deleted
	boolean withComponent = false
	
	static transients = ['deleted']
	static belongsTo = [slide:SmearSlide]
	String toString() { "${component.name} @ ${percentage}% ${withComponent ? 'with' : ''}" }
	String getName() { component.name }
}
