if (typeof jQuery !== 'undefined') {
	(function($) {
		$('#spinner').ajaxStart(function() {
			$(this).fadeIn();
		}).ajaxStop(function() {
			$(this).fadeOut();
		});
	})(jQuery);
}

			function showDetailedItem(itemInstance){
				$('.detailed_item_name').html('This existing content has been replaced with this content.');
				document.getElementById('container').style.visibility="visible";
			}
			function hideDetailedItem(){
				document.getElementById('container').style.visibility="hidden";
			}
			function showUserGallery(){
				document.getElementById('user_gallery').style.visibility="visible";
			}
			function hideUserGallery(){
				document.getElementById('user_gallery').style.visibility="hidden";
			}
function showContainer(id){
	document.getElementById('container'+id).style.visibility="visible";
}
function hideContainer(id){
	document.getElementById('container'+id).style.visibility="hidden";
}

﻿/***************************/
//@Author: Adrian "yEnS" Mato Gondelle
//@website: www.yensdesign.com
//@email: yensamg@gmail.com
//@license: Feel free to use it, but keep this credits please!					
/***************************/

//SETTING UP OUR POPUP
//0 means disabled; 1 means enabled;
var popupStatus = 0;

//loading popup with jQuery magic!
function loadPopup(){
	//loads popup only if it is disabled
	if(popupStatus==0){
		$(".details_outer_div").css({
			"opacity": "0.7"
		});
		$(".details_outer_div").fadeIn("slow");
		$(".details_div").fadeIn("slow");
		popupStatus = 1;
	}
}

//disabling popup with jQuery magic!
function disablePopup(){
	//disables popup only if it is enabled
	if(popupStatus==1){
		$(".details_outer_div").fadeOut("slow");
		$(".details_div").fadeOut("slow");
		popupStatus = 0;
		$(".container").css({
			"visibility": "hidden"
		});
	}
}


//CONTROLLING EVENTS IN jQuery
$(document).ready(function(){
	
	//LOADING POPUP
	//Click the button event!
	$(".details_button").click(function(){
		//load popup
		loadPopup();
	});
				
	//CLOSING POPUP
	//Click the x event!
	$(".details_divClose").click(function(){
		disablePopup();
	});
	//Click out event!
	$(".details_outer_div").click(function(){
		disablePopup();
	});
	//Press Escape event!
	$(document).keyup(function(e){
		if(e.keyCode==27 && popupStatus==1){
			disablePopup();
		}
	});

});
