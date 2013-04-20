<%@ page import="jee_project.Session" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'session.label', default: 'Session')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-session" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="create-session" class="content scaffold-create" role="main">
			<h1 align="center">Connexion</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${sessionInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${sessionInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form align="center"  action="connect" >
				<fieldset class="form">
					<g:render template="form"/>
					<br />
					<g:submitButton name="connect"  value="Connexion" />
				</fieldset>
				
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="account" value="Créer un compte" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>