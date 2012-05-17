
<%@ page import="com.onb.snaph.SnaphUser" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="snaph">
		<script src="http://jqueryjs.googlecode.com/files/jquery-1.2.6.min.js" type="text/javascript"></script>  
    	<script src="popup.js" type="text/javascript"></script> 
		<g:set var="entityName" value="${message(code: 'snaphUser.label', default: 'SnaphUser')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<body>
		<div id="user_gallery" style="margin-top: 20.3%; position: relative;">
		 	<div class="user_wrapper_on_user_gallery">
		 		<g:img uri="/home/giselle/Pictures/Screenshot from 2012-04-23 13:03:21.png" class="user_photo_on_user_gallery" />
		 		<p class="user_name_on_user_gallery">${fieldValue(bean: snaphUserInstance, field: "username")}</p>
		 		<p class="total_items_on_user_gallery">You have posted <b>${snaphUserInstance.items.size()}</b> items in your store.</p>
		 	</div>
		 	<div class="items_wrapper_on_user_gallery">
			 	<g:each in="${snaphUserInstance.items}" status="i" var="itemInstance">
			 		<div class=<%= "left" + ((i%3)+1) %>>
			 			<img src="${createLink(controller: 'item', action:'displayLogo', id:"${itemInstance.id}")}" class="item_photo" />
						<p class="item_name">${fieldValue(bean: itemInstance, field: "itemName")}</p>
						<p class="item_price">${fieldValue(bean: itemInstance, field: "price")}</p>
					    <div class="wrapper_on_hover1">
							<a class="fbicon_button" href="http://www.facebook.com/"><g:img uri="/images/fb-icon.png"/></a>
							<g:img uri="/images/details-button.gif" class="details_button" id="${itemInstance.id}" 
								onclick="showContainer(${itemInstance.id});"/>
						</div> <!-- end of wrapper_on_hover -->
			 		</div>
			 		<g:if test="${( ((i%3)+1) == 3)}">
			 			<div class= "row_space"></div>
			 		</g:if>
			 		
				 <div class="container" id= <%= "container" + "${itemInstance.id}" %> 
				 	style="margin-top: -26%; margin-left: -29%; visibility: hidden;">
				 	<div class="details_outer_div">
				    </div>
					<div class="details_div" >
						<p class="detailed_item_name">${fieldValue(bean: itemInstance, field: "itemName")}</p>
					   	<img src="${createLink(controller: 'item', action:'displayLogo', id:"${itemInstance.id}")}" class="item_photo_on_details" />
					   	<p class="item_price_on_details">${fieldValue(bean: itemInstance, field: "price")}</p>
			            <div class="user_wrapper_on_details">
							<img class="user_photo" src="/home/giselle/261158_284801801673_1294994_q.jpg"/>
					   		<a class="user_name" href="http://www.facebook.com/">${fieldValue(bean: itemInstance, field: "snaphUser")}</a>
					   	</div>
			 		   	<p class="title_description_on_details">Description</p>
					   	<div class="item_description_on_details">
							${fieldValue(bean: itemInstance, field: "description")}
					   	</div>
					   	<div class="comments_title_on_details">
					    	<p class="comments_title">What people say about ${fieldValue(bean: itemInstance, field: "itemName")}</p>
					   	</div>
					   	<div class="comments_on_details">
							<div class="single_comment_on_details">
								<div class="user_on_single_comment">
									<img class="userphoto_on_single_comment" src="/home/giselle/261158_284801801673_1294994_q.jpg"></img>
									<p class="username_on_single_comment">Username</p>
								</div>
								<div class="comment_description_on_single_comment">
									comment comment comment comment comment comment comment comment comment
								</div>
					   		</div>
					   	</div> <!-- end of comments_on_details -->
				        <div class="comment_on_title_on_details">Comment on ${fieldValue(bean: itemInstance, field: "itemName")}</div>
					    <textarea class="comment_textfield" rows="2" cols="88" value="Comment on this product..."></textarea> 
					    <input type="submit" value="Submit" />
				 	</div> <!-- end of details_div -->
				</div> <!-- end of container -->    
				
			 	</g:each>
		 	</div>
		 </div>
	</body>
</html>
