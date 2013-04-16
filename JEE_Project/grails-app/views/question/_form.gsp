<<<<<<< HEAD
<%@ page import="jee_project.Question" %>



<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="question.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="status" from="${questionInstance.constraints.status.inList}" required="" value="${questionInstance?.status}" valueMessagePrefix="question.status"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'answers', 'error')} ">
	<label for="answers">
		<g:message code="question.answers.label" default="Answers" />
		
	</label>
	<g:select name="answers" from="${jee_project.Answer.list()}" multiple="multiple" optionKey="id" size="5" value="${questionInstance?.answers*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'question', 'error')} ">
	<label for="question">
		<g:message code="question.question.label" default="Question" />
		
	</label>
	<g:textField name="question" value="${questionInstance?.question}"/>
</div>

=======
>>>>>>> 526bb394b301b1d540e4243abb5572dc3240f2e3
