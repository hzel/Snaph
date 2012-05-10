<%@ page import="com.onb.snaph.SnaphUser" %>



<div class="fieldcontain ${hasErrors(bean: snaphUserInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="snaphUser.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${snaphUserInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: snaphUserInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="snaphUser.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" value="${snaphUserInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: snaphUserInstance, field: 'facebookID', 'error')} required">
	<label for="facebookID">
		<g:message code="snaphUser.facebookID.label" default="Facebook ID" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="facebookID" required="" value="${snaphUserInstance?.facebookID}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: snaphUserInstance, field: 'accountExpired', 'error')} ">
	<label for="accountExpired">
		<g:message code="snaphUser.accountExpired.label" default="Account Expired" />
		
	</label>
	<g:checkBox name="accountExpired" value="${snaphUserInstance?.accountExpired}" />
</div>

<div class="fieldcontain ${hasErrors(bean: snaphUserInstance, field: 'accountLocked', 'error')} ">
	<label for="accountLocked">
		<g:message code="snaphUser.accountLocked.label" default="Account Locked" />
		
	</label>
	<g:checkBox name="accountLocked" value="${snaphUserInstance?.accountLocked}" />
</div>

<div class="fieldcontain ${hasErrors(bean: snaphUserInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="snaphUser.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${snaphUserInstance?.enabled}" />
</div>

<div class="fieldcontain ${hasErrors(bean: snaphUserInstance, field: 'items', 'error')} ">
	<label for="items">
		<g:message code="snaphUser.items.label" default="Items" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${snaphUserInstance?.items?}" var="i">
    <li><g:link controller="item" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="item" action="create" params="['snaphUser.id': snaphUserInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'item.label', default: 'Item')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: snaphUserInstance, field: 'passwordExpired', 'error')} ">
	<label for="passwordExpired">
		<g:message code="snaphUser.passwordExpired.label" default="Password Expired" />
		
	</label>
	<g:checkBox name="passwordExpired" value="${snaphUserInstance?.passwordExpired}" />
</div>

