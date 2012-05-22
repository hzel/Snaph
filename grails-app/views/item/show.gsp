
<%@ page import="com.onb.snaph.Item"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="snaph">
<g:set var="entityName"
	value="${message(code: 'item.label', default: 'Item')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>


	<div class="container"
		style="width: 62%; margin: 0px auto; position: relative; margin-top: 2%">
		<g:form style="padding-bottom: 20px">
			<g:hiddenField name="id" value="${itemInstance?.id}" />
			<g:actionSubmit action="edit"
				value="${message(code: 'default.button.edit.label', default: 'Edit')}" />
			<g:actionSubmit action="delete"
				value="${message(code: 'default.button.delete.label', default: 'Delete')}"
				onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
		</g:form>
		<p class="detailed_item_name">
			${fieldValue(bean: itemInstance, field: "itemName")}
		</p>
		<img class="item_photo_on_details"
			src="${createLink(controller:'item', action:'displayLogo', id:"${itemInstance.id}")}" />
		<p class="item_price_on_details"
			style="margin-top: -43%; margin-left: 70.9%;">
			<b>Price: </b>
			${fieldValue(bean: itemInstance, field: "price")}
		</p>
		<div class="user_wrapper_on_details"
			style="float: left; margin-left: 70.6%; width: 37%;">
			<img class="user_photo"
				src="/home/giselle/261158_284801801673_1294994_q.jpg" /> <a
				class="user_name"
				href="${createLink(action: 'show', controller: 'snaphUser', id: "${itemInstance.snaphUser.id}")}">
				${fieldValue(bean: itemInstance, field: "snaphUser")}
			</a>
		</div>
		<p class="title_description_on_details">Description</p>
		<div class="item_description_on_details" style="width: 34.6%;">
			${fieldValue(bean: itemInstance, field: "description")}
		</div>
		<div class="comments_title_on_details">
			<p class="comments_title">
				What people say about
				${fieldValue(bean: itemInstance, field: "itemName")}
			</p>
		</div>
		<div class="comments_on_details">
			<g:each in="${itemInstance.comments}" status="i"
				var="commentInstance">
				<div class="single_comment_on_details">
					<div class="user_on_single_comment">
						<img class="userphoto_on_single_comment"
							src="/home/giselle/261158_284801801673_1294994_q.jpg"></img>
						<p class="username_on_single_comment">
							${fieldValue(bean: commentInstance, field: "user")}
						</p>
					</div>
					<div class="comment_description_on_single_comment">
						${fieldValue(bean: commentInstance, field: "comment")}
					</div>
				</div>
			</g:each>
		</div>
		<!-- end of comments_on_details -->
		<div class="comment_on_title_on_details">
			Comment on
			${fieldValue(bean: itemInstance, field: "itemName")}
		</div>
		<g:form controller="comment" action="save">
			<textarea name="comment" class="comment_textfield" rows="2" cols="88"
				style="width: 107%; height: 70px;"></textarea>
			<g:hiddenField name="user" value="${itemInstance?.snaphUser?.id}"></g:hiddenField>
			<g:hiddenField name="item" value="${itemInstance?.id}"></g:hiddenField>
			<g:actionSubmit name="create" action="save" value="Submit" />
		</g:form>
	</div>
	<!-- end of container -->

</body>
</html>
