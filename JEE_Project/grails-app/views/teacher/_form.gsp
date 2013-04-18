<%@ page import="jee_project.Teacher" %>



<div class="fieldcontain ${hasErrors(bean: teacherInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="teacher.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${teacherInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: teacherInstance, field: 'firstname', 'error')} required">
	<label for="firstname">
		<g:message code="teacher.firstname.label" default="Firstname" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstname" required="" value="${teacherInstance?.firstname}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: teacherInstance, field: 'sex', 'error')} ">
	<label for="sex">
		<g:message code="teacher.sex.label" default="Sex" />
		
	</label>
	<g:select name="sex" from="${teacherInstance.constraints.sex.inList}" value="${teacherInstance?.sex}" valueMessagePrefix="teacher.sex" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: teacherInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="teacher.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${teacherInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: teacherInstance, field: 'groups', 'error')} ">
	<label for="groups">
		<g:message code="teacher.groups.label" default="Groups" />
		
	</label>
	<g:select name="groups" from="${jee_project.StudentGroup.list()}" multiple="multiple" optionKey="id" size="5" value="${teacherInstance?.groups*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: teacherInstance, field: 'questions', 'error')} ">
	<label for="questions">
		<g:message code="teacher.questions.label" default="Questions" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${teacherInstance?.questions?}" var="q">
    <li><g:link controller="question" action="show" id="${q.id}">${q?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="question" action="create" params="['teacher.id': teacherInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'question.label', default: 'Question')])}</g:link>
</li>
</ul>

</div>

