<%@ page import="com.onb.snaph.Category" %>



<div class="fieldcontain ${hasErrors(bean: categoryInstance, field: 'category', 'error')} ">
	<label for="category">
		<g:message code="category.category.label" default="Category" />
		
	</label>
	<g:textField name="category" value="${categoryInstance?.category}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: categoryInstance, field: 'items', 'error')} ">
	<label for="items">
		<g:message code="category.items.label" default="Items" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${categoryInstance?.items?}" var="i">
    <li><g:link controller="item" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="item" action="create" params="['category.id': categoryInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'item.label', default: 'Item')])}</g:link>
</li>
</ul>

</div>

