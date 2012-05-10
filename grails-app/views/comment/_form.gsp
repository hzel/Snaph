<%@ page import="com.onb.snaph.Comment" %>



<div class="fieldcontain ${hasErrors(bean: commentInstance, field: 'comment', 'error')} ">
	<label for="comment">
		<g:message code="comment.comment.label" default="Comment" />
		
	</label>
	<g:textField name="comment" value="${commentInstance?.comment}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: commentInstance, field: 'item', 'error')} required">
	<label for="item">
		<g:message code="comment.item.label" default="Item" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="item" name="item.id" from="${com.onb.snaph.Item.list()}" optionKey="id" required="" value="${commentInstance?.item?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: commentInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="comment.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${com.onb.snaph.SnaphUser.list()}" optionKey="id" required="" value="${commentInstance?.user?.id}" class="many-to-one"/>
</div>

