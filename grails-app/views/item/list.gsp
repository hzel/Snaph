
<%@ page import="com.onb.snaph.Item" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="snaph">
		<script src="http://jqueryjs.googlecode.com/files/jquery-1.2.6.min.js" type="text/javascript"></script>  
    	<script src="popup.js" type="text/javascript"></script> 
	</head>

	<body>
	
	   	<div id="public_gallery">
		   	<g:each in="${itemInstanceList}" status="i" var="itemInstance">
				<div class= <%= "left" + (i%4) %>>
					<!-- <g:img uri="/home/giselle/Pictures/Screenshot from 2012-04-23 13:03:21.png" class="item_photo" /> -->
					<img src="${createLink(action:'displayLogo', id:"${itemInstance.id}")}" class="item_photo" />
					<p class="item_name">${fieldValue(bean: itemInstance, field: "itemName")}</p>
					<p class="item_price">${fieldValue(bean: itemInstance, field: "price")}</p>
					<div class="user_wrapper">
					   	<img class="user_photo" src="/home/giselle/261158_284801801673_1294994_q.jpg"/>
					   		<a class="user_name" href="${createLink(action: 'show', controller: 'snaphUser', id: "${itemInstance.snaphUser.id}")}">${fieldValue(bean: itemInstance, field: "snaphUser")}</a>
					</div> <!-- end of user_wrapper -->
				    <div class="wrapper_on_hover1">
						<a class="fbicon_button" href="http://www.facebook.com/"><g:img uri="/images/fb-icon.png"/></a>
						<!-- <g:link action="show" id="${itemInstance.id}"> -->
							<g:img uri="/images/details-button.gif" class="details_button" id="${itemInstance.id}" 
								onclick="showContainer(${itemInstance.id});"/>
						<!-- </g:link> -->
					</div> <!-- end of wrapper_on_hover -->
				 </div> <!-- end of left0 -->
				 <g:if test="${(i%4 == 3)}">
				 	<div class= "row_space"></div>
				 </g:if>
		 
				 <div class="container" id= <%= "container" + "${itemInstance.id}" %> style="visibility: hidden;">
				 	<div class="details_outer_div">
				    </div>
					<div class="details_div" >
						<p class="detailed_item_name">${fieldValue(bean: itemInstance, field: "itemName")}</p>
					   	<img class="item_photo_on_details" src="${createLink(action:'displayLogo', id:"${itemInstance.id}")}" />
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
		 
	</body>
</html>
