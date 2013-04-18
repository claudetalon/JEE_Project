
<%@ page import="jee_project.Teacher" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'teacher.label', default: 'Teacher')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-teacher" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-teacher" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'teacher.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="firstname" title="${message(code: 'teacher.firstname.label', default: 'Firstname')}" />
					
						<g:sortableColumn property="sex" title="${message(code: 'teacher.sex.label', default: 'Sex')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'teacher.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="mdp" title="${message(code: 'teacher.mdp.label', default: 'Mdp')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${teacherInstanceList}" status="i" var="teacherInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${teacherInstance.id}">${fieldValue(bean: teacherInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: teacherInstance, field: "firstname")}</td>
					
						<td>${fieldValue(bean: teacherInstance, field: "sex")}</td>
					
						<td>${fieldValue(bean: teacherInstance, field: "email")}</td>
					
						<td>${fieldValue(bean: teacherInstance, field: "mdp")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${teacherInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
