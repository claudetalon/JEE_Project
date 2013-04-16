<%@ page import="jee_project.Answer" %>



<div class="fieldcontain ${hasErrors(bean: answerInstance, field: 'answer', 'error')} ">
	<label for="answer">
		<g:message code="answer.answer.label" default="Answer" />
		
	</label>
	<g:textField name="answer" value="${answerInstance?.answer}"/>
</div>

