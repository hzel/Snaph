package com.onb.snaph

import org.springframework.web.multipart.MultipartHttpServletRequest

class UploadController {

	def index() { }

	def upload(){
		if(request.method == "POST"){
				
		}
//			if(request instanceof MultipartHttpServletRequest){
//				MultipartHttpServletRequest mpr = (MultipartHttpServletRequest)request;
//				byte[] image = params.image
//				String name = params.name
//				String price = params.price
//				String description = params.description
//				String token = params.token
//				
//				
//				response.status = 200 // Created
//				}
//			else{
//				System.out.println("request is not of type MultipartHttpServletRequest\n")
//				
//				}
//		}
//		else{
//			System.out.println("invalid request. can only accept post");
//		}
	}
}
