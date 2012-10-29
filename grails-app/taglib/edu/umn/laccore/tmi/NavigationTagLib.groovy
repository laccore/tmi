package edu.umn.laccore.tmi

class NavigationTagLib {

	transient springSecurityService

	static namespace = "tmi"
	
	def emoticon = { attrs, body ->
		out << body() << (attrs.happy == 'true' ? " :-)" : " :-(")
	}
	
	/**
     * Creates an unordered list of unique first letters among all mineral/minearaloid UniqueIdentifications
     */
	def mineralLinks = { attrs, body ->
		//def minerals = UniqueIdentification.findAllByIdentificationTypeInList([IdentificationType.findByName("Mineral"), IdentificationType.findByName("Mineraloid")])
		def minerals = UniqueIdentification.findAllByIdentificationType(IdentificationType.findByName("Mineral"))
		def currentLetterUpper = "ZZZ"
		def currentLetterLower = "zzz"
		out << "<ul>" 
		minerals.each { m -> 
			if (!m.name.startsWith(currentLetterUpper)) {
				currentLetterUpper = m.name.getAt(0).toUpperCase()
				currentLetterLower = currentLetterUpper.toLowerCase()
				out << "<li>"
				out << g.link(controller:'inorganic', action:'list', params:[id:currentLetterLower]){currentLetterUpper}
				out << "</li>"
			}
		}
		out << "<li>"
		out << g.link(controller:'inorganic', action:'lithofacies'){"Lithofacies"}
		out << "</li>"
		out << "<li>"
		out << g.link(controller:'inorganic', action:'contaminant'){"Contaminant"}
		out << "</li>"
		out << "</ul>"
	}
	
	/**
	* Creates an unordered list of links to organic identification types
	*/
   def organicLinks = { attrs, body ->
	   def types = IdentificationType.findAllBySupertype("Organic")
	   //System.out.println("organcis size:${types?.size}")
	   out << "<ul>"
	   types?.each { t ->
		   out << "<li>"
		   out << g.link(controller:'organic', action:'list', params:[id:t.name.toLowerCase()]){"$t.label"}
		   out << "</li>"
	   }
	   out << "</ul>"
   }
	
	/**
	* Creates an unordered list of unique first letters among all glossary entries.
	*/
   def glossaryLinks = { attrs, body ->
	   def entries = Glossary.findAll()
	   def currentLetterUpper = "ZZZ"
	   def currentLetterLower = "zzz"
	   out << "<ul>"
	   entries.each { e ->
		   if (!e.name.startsWith(currentLetterUpper)) {
			   currentLetterUpper = e.name.getAt(0).toUpperCase()
			   currentLetterLower = currentLetterUpper.toLowerCase()
			   out << "<li>"
			   out << g.link(controller:'glossary', action:'list', params:[id:currentLetterLower]){currentLetterUpper}
			   out << "</li>"
		   }
	   }
	   out << "</ul>"
   }
}