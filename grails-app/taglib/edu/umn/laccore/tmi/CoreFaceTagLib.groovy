package edu.umn.laccore.tmi

class CoreFaceTagLib {
	def annotImageMetadata = { attrs, body ->
		def image = Image.get(attrs.id)
		if ( image.taxon?.length() > 0 || image.family?.length() > 0) {
			out << "Taxon: ${image.taxon?:'not specified'}<br/>"
			out << "Family: ${image.family?:'not specified'}<br/>"
		}
		if ( image.lakeName?.length() > 0 )
			out << "Site name: ${image.lakeName?:'not specified'}<br/>"
		out << "Light type: ${image.lightType?:'not specified'}<br/>"
		out << "Magnification: ${image.magnification?:'not specified'}<br/>"
		out << "Submitted by: ${image.submittedBy?:'not specified'}<br/>"
		out << "Notes: ${image.notes?:'none'}"
	}
}
