package edu.umn.laccore.tmi

import java.util.Date;

class XapResource {

    static constraints = {
		summary()
		packagingScript(nullable:true)
		metadataSql(nullable:true, widget:'textarea')
		deploymentXap(nullable:true)
    }
	
	static mapping = {
		deploymentXap sqlType:'longblob'
		metadataSql type:'text'
		packagingScript sqlType:'blob'
	}
	
	Date dateCreated
	Date lastUpdated
	String summary
	byte[] packagingScript
	String metadataSql
	byte[] deploymentXap
}
