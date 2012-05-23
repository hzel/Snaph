<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'snaph.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
		<g:layoutHead/>
        <r:layoutResources />
	</head>
	<body>
	
		<div class="header">
			<a href="${createLink(action: 'list', controller: 'item')}"><g:img id="snaph_logo" uri="/images/SnaphLogo.gif"/></a>
			<g:form controller="login" class="buttons_container">
			 <sec:ifNotGranted roles="ROLE_FACEBOOK">
			  Welcome, guest!
              <li><facebookAuth:connect permissions="${['email', 'user_about_me']}"/></li>
            </sec:ifNotGranted>
            <sec:ifAllGranted roles="ROLE_FACEBOOK">
               Welcome, <a href="${createLink(action: 'show', controller: 'snaphUser', id: 1)}"><b>${name}${profPic}</b></a>!<br>
            </sec:ifAllGranted>
				<!-- if logged in
				<g:actionSubmit name="login" action="index" value="Logout"/>
				-->
			</g:form>
		</div>
	   	<div class="menu_bar"></div>
	   	
		<g:layoutBody/>
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		<g:javascript library="application"/>
        <r:layoutResources />
	</body>
</html>