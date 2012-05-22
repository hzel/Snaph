<%@ page import="com.onb.snaph.Item" %>



<div class="fieldcontain ${hasErrors(bean: itemInstance, field: 'image', 'error')} required">
	<label for="image">
		<g:message code="item.image.label" default="Image" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="image" name="image" value="http://10.10.5.51:8080/Snaph/image/${itemInstance?.id}"/>
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

