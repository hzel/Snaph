class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}
		"upload/"(controller:"Upload",action:"upload")
		"/"(view:"/index")
		"500"(view:'/error')
	}
}
