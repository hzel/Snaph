
<%@ page import="com.onb.snaph.Item" %>
<!doctype html>
<html>
	<head>
		<style type='text/css'>
			.header {
			   position: relative;
			   height: 100px;
			   background-color: #989898; 
			   padding: 10px;
			}
			.menu_bar {
			   background-color: #A8A8A8; 
			   position: relative;
			   height: 50px;
			   padding: 5px;
			}
			.row_space {
			   position: relative;
			   float: left;
			   left: 0.00em;
			   width: 100%;
			   height: 20px;
			   background-color: #cccccc;
			}
			.left0 {
			   position: relative;
			   float: left;
			   left: 60px;
			   width: 22.57em;
			   height: 300px;
			   background-color: #ffffff;
			}
			.wrapper_on_hover1 {
			   opacity: 0;
			   position: absolute;
			   left: 0px;
			   top: 0px;
			   width: 248px;
			   height: 239px;
			   padding: 10px;
			}
			.wrapper_on_hover1:hover {
			   opacity: 1;
			}
			.details_button {
			   position: absolute;
			   bottom: 40px;
			   right: 90px;
			}
			.comments_button {
			   position: absolute;
			   top: 20px;
			   right: 50px;
			}
			
			.left1 {
			   position: relative;
			   float: left;
			   left: 85px;
			   width: 22.57em;
			   height: 300px;
			   background-color: #ffffff
			}
			.left2 {
			   position: relative;
			   float: left;
			   left: 110px;
			   width: 22.57em;
			   height: 300px;
			   background-color: #ffffff
			}
			.left3 {
			   position: relative;
			   float: left;
			   left: 135px;
			   width: 22.57em; /** equivalent to 248px; **/
			   height: 300px;
			   background-color: #ffffff
			}
			.item_photo {
			   margin: 10px;
			   width: 226px;
			   height: 140px;
			   border: 1px solid #000000;
			}
			.item_name {
			   margin-top: -5px;
			   margin-left: 10px;
			   font-weight: bold;
			   font-size: 18px;
			   text-transform:uppercase;
			}
			.item_price {
			   margin-top: -20px;
			   margin-left: 10px;
			   font-size: 14px;
			   text-transform:uppercase;
			}
			.user_wrapper {
			   margin-top: 44px; 
			   width: 248px;
			   height: 61px;
			   background-color: #E0E0E0;  
			}
			.user_photo {
			   position: absolute;
			   margin: 10px;
			   width: 40px;
			   height: 40px;
			   border: 1px solid #000000;
			}
			.user_name {
			   float: left;
			   padding-left: 70px;
			   padding-top: 20px;
			   font-weight: bold;
			   font-size: 14px;
			}
			.details_outer_div {
			   background-color: #000000;
			   position: fixed;
			   height: 100%;
			   width: 100%;
			   top: 0;
			   opacity: .8;
			   z-index: 20;
			}
			.details_div {
			   background-color: #ffffff;
			   position: fixed;
			   margin-top: -15%;
			   margin-left: 15%;
			   height: 500px;
			   width: 800px;
			   padding: 20px;
			   z-index: 21;
			}
			.item_photo_on_details {
			   width: 500px;
			   height: 300px;
			}
			.item_price_on_details {
			   float: right;
			   margin-top: 5px;
			   margin-right: 230px;
			}
			.user_wrapper_on_details {
			   float: right;
			   margin-top: -270px;
			   margin-right: 25px;
			   width: 248px;
			   height: 61px;
			   background-color: #E0E0E0;  
			}
			body {
			   border-width: 0px;
			   padding: 0px;
			   margin: 0px;
			   font-size: 11px;
			   background-color: #cccccc;
			}
			
		</style>
	</head>

	<body>
		
	   	<div class="header">
			<button onclick="">Join Snaph</button>
		    <button onclick="">Login</button>
		    <div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
	   	</div>
	   	<div class="menu_bar">
	      	<a class="home_button" href="http://www.facebook.com/">HOME</a>
	      	<input type="text"></input>
	      	<button onclick="">Search</button>
	   	</div>
	   	
	   	
	   	<g:each in="${itemInstanceList}" status="i" var="itemInstance">
	   		
			<div class= <%= "left" + (i%4) %>>
				<img class="item_photo" src="/home/giselle/Pictures/Screenshot from 2012-04-23 13:03:21.png"/>
				<p class="item_name">${fieldValue(bean: itemInstance, field: "itemName")}</p>
				<p class="item_price">${fieldValue(bean: itemInstance, field: "price")}</p>
				<div class="user_wrapper">
				   <img class="user_photo" src="/home/giselle/261158_284801801673_1294994_q.jpg"/>
				   <a class="user_name" href="http://www.facebook.com/">Username</a>
				</div> <!-- end of user_wrapper -->
			    <div class="wrapper_on_hover1">
					<a class="fbicon_button" href="http://www.facebook.com/"><img src="/home/giselle/fb-icon.png"/></a>
					<a class="details_button" href="#">Details</a>
					<a class="comments_button" href="#" onclick="">Comments</a>
			    </div> <!-- end of wrapper_on_hover -->
			 </div> <!-- end of left0 -->
			 <g:if test="${(i%4 == 3)}">
			 	<div class= "row_space"></div>
			 </g:if>
		 </g:each>
	</body>
</html>
