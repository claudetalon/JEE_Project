class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			controller = user
			constraints {
				// apply constraints here
			}
		}

		"/"(view:"login")
		"500"(view:'/error')
	}
}
