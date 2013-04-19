<%@ page import="jee_project.Session" %>




<div align="center">
<div class="fieldcontain  ${hasErrors(bean: sessionInstance, field: 'login', 'error')} ">
	<label  for="login">
		<g:message code="session.login.label" default="Login" />
	</label>
	<g:textField name="login" value="${sessionInstance?.login}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sessionInstance, field: 'password', 'error')} ">
	<label for="password">
		<g:message code="session.password.label" default="Password" />
		
	</label>
	<input name="password" type="password" value="${sessionInstance?.password}"/>
</div>
</div>

