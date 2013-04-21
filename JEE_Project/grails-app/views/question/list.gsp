
<%@ page import="jee_project.Question" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-question" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="home" controller="user" action="goHome"><g:message code="default.home.label"/></g:link></li>
				<g:if test="${session?.ens==true}"><li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li></g:if>
				<li><g:link controller="user" action="disconnect">Deconnecter ${session.login}</g:link></li>
			</ul>
		</div>
		<div id="list-question" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="question" title="${message(code: 'question.status.label', default: 'Question')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'question.question.label', default: 'Status')}" />
					
						<th><g:message code="question.teacher.label" default="Teacher" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${questionInstanceList}" status="i" var="questionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${questionInstance.id}">${fieldValue(bean: questionInstance, field: "question")}</g:link></td>
					
						<td>${fieldValue(bean: questionInstance, field: "status")}</td>
					
						<td>${fieldValue(bean: questionInstance, field: "teacher")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${questionInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
