<%@ page import="jee_project.Student" %>



<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="student.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${studentInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'firstname', 'error')} required">
	<label for="firstname">
		<g:message code="student.firstname.label" default="Firstname" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstname" required="" value="${studentInstance?.firstname}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'sex', 'error')} ">
	<label for="sex">
		<g:message code="student.sex.label" default="Sex" />
		
	</label>
	<g:select name="sex" from="${studentInstance.constraints.sex.inList}" value="${studentInstance?.sex}" valueMessagePrefix="student.sex" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="student.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${studentInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'gstudent', 'error')} ">
	<label for="gstudent">
		<g:message code="student.gstudent.label" default="Gstudent" />
		
	</label>
	<g:select id="gstudent" name="gstudent.id" from="${jee_project.StudentGroup.list()}" optionKey="id" value="${studentInstance?.gstudent?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'mdp', 'error')} ">
	<label for="mdp">
		<g:message code="student.mdp.label" default="Mdp" />
		
	</label>
	<g:textField name="mdp" value="${studentInstance?.mdp}"/>
</div>

