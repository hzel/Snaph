<%@ page import="com.onb.snaph.Item" %>



<div class="fieldcontain ${hasErrors(bean: itemInstance, field: 'image', 'error')} required">
	<label for="image">
		<g:message code="item.image.label" default="Image" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="image" name="image" />
</div>

<div class="fieldcontain ${hasErrors(bean: itemInstance, field: 'category', 'error')} required">
	<label for="category">
		<g:message code="item.category.label" default="Category" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="category" name="category.id" from="${com.onb.snaph.Category.list()}" optionKey="id" required="" value="${itemInstance?.category?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: itemInstance, field: 'comments', 'error')} ">
	<label for="comments">
		<g:message code="item.comments.label" default="Comments" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${itemInstance?.comments?}" var="c">
    <li><g:link controller="comment" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="comment" action="create" params="['item.id': itemInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'comment.label', default: 'Comment')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: itemInstance, field: 'dateAdded', 'error')} required">
	<label for="dateAdded">
		<g:message code="item.dateAdded.label" default="Date Added" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateAdded" precision="day"  value="${itemInstance?.dateAdded}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: itemInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="item.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${itemInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: itemInstance, field: 'itemName', 'error')} ">
	<label for="itemName">
		<g:message code="item.itemName.label" default="Item Name" />
		
	</label>
	<g:textField name="itemName" value="${itemInstance?.itemName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: itemInstance, field: 'price', 'error')} ">
	<label for="price">
		<g:message code="item.price.label" default="Price" />
		
	</label>
	<g:textField name="price" value="${itemInstance?.price}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: itemInstance, field: 'snaphUser', 'error')} required">
	<label for="snaphUser">
		<g:message code="item.snaphUser.label" default="Snaph User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="snaphUser" name="snaphUser.id" from="${com.onb.snaph.SnaphUser.list()}" optionKey="id" required="" value="${itemInstance?.snaphUser?.id}" class="many-to-one"/>
</div>

