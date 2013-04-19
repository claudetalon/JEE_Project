<%@ page import="jee_project.Question" %>


<g:if test="${session?.ens==true}">
<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="question.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="status" from="${questionInstance.constraints.status.inList}" required="" value="${questionInstance?.status}" valueMessagePrefix="question.status"/>
</div>
</g:if>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'question', 'error')} ">
	<label for="question">
		<g:message code="question.question.label" default="Question" />
		
	</label>
	<g:textField name="question" value="${questionInstance?.question}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'answers', 'error')} ">
	<label for="answers">
		<g:message code="question.answers.label" default="Answers" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${questionInstance?.answers?}" var="a">
    <li><g:link controller="answer" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="answer" action="create" params="['question.id': questionInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'answer.label', default: 'Answer')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'teacher', 'error')} required">
	<label for="teacher">
		<g:message code="question.teacher.label" default="Teacher" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="teacher" name="teacher.id" from="${jee_project.Teacher.list()}" optionKey="id" required="" value="${questionInstance?.teacher?.id}" class="many-to-one"/>
</div>

