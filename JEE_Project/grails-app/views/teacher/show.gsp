
<%@ page import="jee_project.Teacher" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'teacher.label', default: 'Teacher')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-teacher" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="list" controller="studentGroup" action="list"><g:message code="Students Groups list" args="[entityName]" /></g:link></li>
				<li><g:link controller="user" action="disconnect">Deconnecter ${session.login}</g:link></li>
			</ul>
		</div>
		<div id="show-teacher" class="content scaffold-show" role="main">
			<h1>Bienvenue ${teacherInstance?.firstname} ${teacherInstance?.name}</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list teacher">
			
				<g:if test="${teacherInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="teacher.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${teacherInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${teacherInstance?.firstname}">
				<li class="fieldcontain">
					<span id="firstname-label" class="property-label"><g:message code="teacher.firstname.label" default="Firstname" /></span>
					
						<span class="property-value" aria-labelledby="firstname-label"><g:fieldValue bean="${teacherInstance}" field="firstname"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${teacherInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="teacher.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${teacherInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${teacherInstance?.groups}">
				<li class="fieldcontain">
					<span id="groups-label" class="property-label"><g:message code="teacher.groups.label" default="Groups" /></span>
					
						<g:each in="${teacherInstance.groups}" var="g">
						<span class="property-value" aria-labelledby="groups-label"><g:link controller="studentGroup" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				
			
				<g:if test="${teacherInstance?.questions}">
				<li class="fieldcontain">
					<span id="questions-label" class="property-label"><g:message code="teacher.questions.label" default="Questions" /></span>
					
						<g:each in="${teacherInstance.questions}" var="q">
						<span class="property-value" aria-labelledby="questions-label"><g:link controller="question" action="show" id="${q.id}">${q?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${teacherInstance?.id}" />
					<g:if test="${session?.login==teacherInstance?.login}"><g:link class="edit" action="edit" id="${teacherInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link></g:if>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
