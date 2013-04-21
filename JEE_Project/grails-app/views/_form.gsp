<%@ page import="jee_project.Session" %>


<div align="center">
	<label  for="login">
		<g:message code="session.login.label" default="Login" />
	</label>
	<div  ${hasErrors(bean: sessionInstance, field: 'login', 'error')} ">
	
	<g:textField name="login" value="${sessionInstance?.login}"/>
	</div>
	<br />
	<label for="password">
		<g:message code="session.password.label" default="Password" />
		
	</label>

	<div  ${hasErrors(bean: sessionInstance, field: 'password', 'error')} ">
		<input name="password" type="password" value="${sessionInstance?.password}"/>
	</div>
</div>
