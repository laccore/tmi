class UrlMappings {

	static mappings = {
		"/components/**"(controller:"componentImage")
		
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(view:"/index")
		"500"(view:'/error')
	}
}
