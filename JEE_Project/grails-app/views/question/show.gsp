
<%@ page import="jee_project.Question" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-question" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<g:if test="${session?.ens==true}"><li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li></g:if>
				<li><g:link controller="user" action="disconnect">Deconnecter ${session.login}</g:link></li>
			</ul>
		</div>
		<div id="show-question" class="content scaffold-show" role="main">
			<h1><g:fieldValue bean="${questionInstance}" field="question"/></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list question">
				
				<g:if test="${questionInstance?.answers}">
				<li class="fieldcontain">
					<span id="answers-label" class="property-label"><g:message code="question.answers.label" default="Answers" /></span>
					
					<g:form name="vote" action="vote" id="${questionInstance?.id}" >
						<g:each in="${questionInstance.answers}" var="a">
						
							<span class="property-value" aria-labelledby="answers-label">
								<g:if test="${questionInstance?.status=="opened"}">
									<g:if test="${session?.ens==false}"><g:if test="${questionInstance?.type=="sondage"}"><INPUT type= "radio" name="answer" value="${a.id}" /></g:if></g:if>
								</g:if>
						
								<g:link controller="answer" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link>
									<g:if test="${questionInstance?.status=="closed"}">
									</g:if>
							</span>
						</g:each>
						<br />
						<span class="property-value" aria-labelledby="answers-label">
							<g:if test="${questionInstance?.status=="opened"}">
								<g:if test="${session?.ens==false}"><g:if test="${questionInstance?.type=="sondage"}"><g:submitButton name="Voter"/></g:if></g:if>
							</g:if>
						</span>
					</g:form>
				</li>
				</g:if>
				
				<g:if test="${questionInstance?.status=="closed"}">
				<g:if test="${questionInstance?.type=="sondage"}">
				<li class="fieldcontain">
					<g:form name="Resuktats" action="results" >
						<span class="property-value" aria-labelledby="answers-label">
								<fieldset class="form">
									<g:render template="piechart" />
								</fieldset>
						</span>
					</g:form>
				</li>
				</g:if>
				</g:if>
				<g:if test="${questionInstance?.teacher}">
				<li class="fieldcontain">
					<span id="teacher-label" class="property-label"><g:message code="question.teacher.label" default="Teacher" /></span>
					
						<span class="property-value" aria-labelledby="teacher-label"><g:link controller="teacher" action="show" id="${questionInstance?.teacher?.id}">${questionInstance?.teacher?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${questionInstance?.id}" />
					<g:if test="${session?.ens==true}"><g:link class="edit" action="edit" id="${questionInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link></g:if>
					<g:if test="${session?.ens==true}"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></g:if>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
