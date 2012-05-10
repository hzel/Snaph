
<%@ page import="com.onb.snaph.SnaphUser" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'snaphUser.label', default: 'SnaphUser')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-snaphUser" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-snaphUser" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="username" title="${message(code: 'snaphUser.username.label', default: 'Username')}" />
					
						<g:sortableColumn property="password" title="${message(code: 'snaphUser.password.label', default: 'Password')}" />
					
						<g:sortableColumn property="facebookID" title="${message(code: 'snaphUser.facebookID.label', default: 'Facebook ID')}" />
					
						<g:sortableColumn property="accountExpired" title="${message(code: 'snaphUser.accountExpired.label', default: 'Account Expired')}" />
					
						<g:sortableColumn property="accountLocked" title="${message(code: 'snaphUser.accountLocked.label', default: 'Account Locked')}" />
					
						<g:sortableColumn property="enabled" title="${message(code: 'snaphUser.enabled.label', default: 'Enabled')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${snaphUserInstanceList}" status="i" var="snaphUserInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${snaphUserInstance.id}">${fieldValue(bean: snaphUserInstance, field: "username")}</g:link></td>
					
						<td>${fieldValue(bean: snaphUserInstance, field: "password")}</td>
					
						<td>${fieldValue(bean: snaphUserInstance, field: "facebookID")}</td>
					
						<td><g:formatBoolean boolean="${snaphUserInstance.accountExpired}" /></td>
					
						<td><g:formatBoolean boolean="${snaphUserInstance.accountLocked}" /></td>
					
						<td><g:formatBoolean boolean="${snaphUserInstance.enabled}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${snaphUserInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
