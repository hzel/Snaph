
<%@ page import="com.onb.snaph.Item" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'item.label', default: 'Item')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-item" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-item" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list item">
			
				<g:if test="${itemInstance?.image}">
				<li class="fieldcontain">
					<span id="image-label" class="property-label"><g:message code="item.image.label" default="Image" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${itemInstance?.category}">
				<li class="fieldcontain">
					<span id="category-label" class="property-label"><g:message code="item.category.label" default="Category" /></span>
					
						<span class="property-value" aria-labelledby="category-label"><g:link controller="category" action="show" id="${itemInstance?.category?.id}">${itemInstance?.category?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${itemInstance?.comments}">
				<li class="fieldcontain">
					<span id="comments-label" class="property-label"><g:message code="item.comments.label" default="Comments" /></span>
					
						<g:each in="${itemInstance.comments}" var="c">
						<span class="property-value" aria-labelledby="comments-label"><g:link controller="comment" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${itemInstance?.dateAdded}">
				<li class="fieldcontain">
					<span id="dateAdded-label" class="property-label"><g:message code="item.dateAdded.label" default="Date Added" /></span>
					
						<span class="property-value" aria-labelledby="dateAdded-label"><g:formatDate date="${itemInstance?.dateAdded}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${itemInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="item.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${itemInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${itemInstance?.itemName}">
				<li class="fieldcontain">
					<span id="itemName-label" class="property-label"><g:message code="item.itemName.label" default="Item Name" /></span>
					
						<span class="property-value" aria-labelledby="itemName-label"><g:fieldValue bean="${itemInstance}" field="itemName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${itemInstance?.price}">
				<li class="fieldcontain">
					<span id="price-label" class="property-label"><g:message code="item.price.label" default="Price" /></span>
					
						<span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${itemInstance}" field="price"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${itemInstance?.snaphUser}">
				<li class="fieldcontain">
					<span id="snaphUser-label" class="property-label"><g:message code="item.snaphUser.label" default="Snaph User" /></span>
					
						<span class="property-value" aria-labelledby="snaphUser-label"><g:link controller="snaphUser" action="show" id="${itemInstance?.snaphUser?.id}">${itemInstance?.snaphUser?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${itemInstance?.id}" />
					<g:link class="edit" action="edit" id="${itemInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
