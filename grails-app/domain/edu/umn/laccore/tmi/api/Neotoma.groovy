package edu.umn.laccore.tmi.api

class Neotoma {
	
	static final BASE_URI = "api.neotomadb.org/v1/data/"	//http://api.neotomadb.org/v1/data/taxa?taxonname=Abies

    static constraints = {
		
    }
	
	String tmiTaxon	//Image.taxon value
	String endpoint	//taxa
	String response //{"success":1,"data":[{"TaxonName":"Abies","EcolGroups":["TRSH"],"TaxonCode":"Abi","Author":"Miller, 1754","PublicationID":299,"TaxonID":1,"TaxaGroupID":"VPL","HigherTaxonID":533,"Extinct":false,"Notes":null}]}
}
