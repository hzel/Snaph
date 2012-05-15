<%@ page import="com.onb.snaph.Item" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="snaph">
	</head>
	
	<body>
		<div id="user_gallery" style="visibility: hidden">
		 	<div class="user_wrapper_on_user_gallery">
		 		<g:img uri="/home/giselle/Pictures/Screenshot from 2012-04-23 13:03:21.png" class="user_photo_on_user_gallery" />
		 		<p class="user_name_on_user_gallery">User's Facebook Name</p>
		 		<p class="total_items_on_user_gallery">You have posted <b>200</b> items in your store.</p>
		 		<p class="sort_items_on_user_gallery">Sort your items by:</p>
		 		<ul class="category_list_on_user_gallery">
					<li>Electronics</li>
					<li>Fashion</li>
					<li>Toys</li>
					<li>Laptops</li>
					<li>Console</li>
				</ul>
		 	</div>
		 	<div class="items_category_on_user_gallery">Category</div>
		 	<div class="items_wrapper_on_user_gallery">
		 		
		 		<div class="left1">
		 			<g:img uri="/home/giselle/Pictures/Screenshot from 2012-04-23 13:03:21.png" class="item_photo" />
					<p class="item_name"><g:fieldValue bean="${itemInstance}" field="itemName"/></p>
					<p class="item_price">PRICE</p>
					<div class="user_wrapper">
					   <img class="user_photo" src="/home/giselle/261158_284801801673_1294994_q.jpg"/>
					   <a class="user_name" href="http://www.facebook.com/">Username</a>
					</div> <!-- end of user_wrapper -->
				    <div class="wrapper_on_hover1">
						<a class="fbicon_button" href="http://www.facebook.com/"><g:img uri="/images/fb-icon.png"/></a>
						<g:img uri="/images/details-button.gif" class="details_button" onclick="showDetailedItem();"/>
					</div> <!-- end of wrapper_on_hover -->
		 		</div>
		 		<div class="left2"></div>
		 		<div class="left3"></div>
		 		<div class= "row_space"></div>
		 	</div>
		 </div>
	</body>
</html>