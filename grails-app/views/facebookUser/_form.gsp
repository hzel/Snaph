<%@ page import="com.onb.snaph.FacebookUser" %>



<div class="fieldcontain ${hasErrors(bean: facebookUserInstance, field: 'uid', 'error')} required">
	<label for="uid">
		<g:message code="facebookUser.uid.label" default="Uid" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="uid" required="" value="${fieldValue(bean: facebookUserInstance, field: 'uid')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: facebookUserInstance, field: 'accessToken', 'error')} ">
	<label for="accessToken">
		<g:message code="facebookUser.accessToken.label" default="Access Token" />
		
	</label>
	<g:textField name="accessToken" value="${facebookUserInstance?.accessToken}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: facebookUserInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="facebookUser.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${facebookUserInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: facebookUserInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="facebookUser.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${com.onb.snaph.User.list()}" optionKey="id" required="" value="${facebookUserInstance?.user?.id}" class="many-to-one"/>
</div>

