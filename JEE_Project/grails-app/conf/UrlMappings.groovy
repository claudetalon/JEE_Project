class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			controller = session
			constraints {
				// apply constraints here
			}
		}

		"/"(view:"/session/create")
		"500"(view:'/error')
	}
}
