
<%@ page import="jee_project.Student" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'student.label', default: 'Student')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-student" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="home" controller="user" action="goHome"><g:message code="default.home.label"/></g:link></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link controller="user" action="disconnect">Deconnecter ${session.login}</g:link></li>
			</ul>
		</div>
		<div id="show-student" class="content scaffold-show" role="main">
			<h1>Bienvenue ${studentInstance?.firstname} ${studentInstance?.name}</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list student">
			
				<g:if test="${studentInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="student.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${studentInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${studentInstance?.firstname}">
				<li class="fieldcontain">
					<span id="firstname-label" class="property-label"><g:message code="student.firstname.label" default="Firstname" /></span>
					
						<span class="property-value" aria-labelledby="firstname-label"><g:fieldValue bean="${studentInstance}" field="firstname"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${studentInstance?.sex}">
				<li class="fieldcontain">
					<span id="sex-label" class="property-label"><g:message code="student.sex.label" default="Sex" /></span>
					
						<span class="property-value" aria-labelledby="sex-label"><g:fieldValue bean="${studentInstance}" field="sex"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${studentInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="student.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${studentInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${studentInstance?.gstudent}">
				<li class="fieldcontain">
					<span id="gstudent-label" class="property-label"><g:message code="student.gstudent.label" default="Groupe" /></span>
					
						<span class="property-value" aria-labelledby="gstudent-label"><g:link controller="studentGroup" action="show" id="${studentInstance?.gstudent?.id}">${studentInstance?.gstudent?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${studentInstance?.gstudent?.questions}">
					<li class="fieldcontain">
						<span id="answers-label" class="property-label"><g:message code="student.gstudent.questions.label" default="Question" /></span>
						
							<g:each in="${studentInstance.gstudent.questions}" var="a">
							
							<span class="property-value" aria-labelledby="answers-label"><g:link controller="question" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
							
							</g:each>
						
					</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${studentInstance?.id}" />
					<g:if test="${session?.login==studentInstance?.login}"><g:link class="edit" action="edit" id="${studentInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link></g:if>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
