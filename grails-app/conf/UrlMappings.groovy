class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}
		"/upload"(controller:"Upload",action:"uploadData")
		"/retrieve/$token?"(controller:"Retrieve",action:"retrieveData")
		"/image/$id?"(controller:"Item",action:"displayLogo")
		"/item_profile/$id?"(controller:"Item",action:"show")
		"/"(view:"/index")
		"500"(view:'/error')
	}
}
