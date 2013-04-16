<%@ page import="jee_project.Answer" %>



<div class="fieldcontain ${hasErrors(bean: answerInstance, field: 'answer', 'error')} ">
	<label for="answer">
		<g:message code="answer.answer.label" default="Answer" />
		
	</label>
	<g:textField name="answer" value="${answerInstance?.answer}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: answerInstance, field: 'question', 'error')} required">
	<label for="question">
		<g:message code="answer.question.label" default="Question" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="question" name="question.id" from="${jee_project.Question.list()}" optionKey="id" required="" value="${answerInstance?.question?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: answerInstance, field: 'valid', 'error')} ">
	<label for="valid">
		<g:message code="answer.valid.label" default="Valid" />
		
	</label>
	<g:checkBox name="valid" value="${answerInstance?.valid}" />
</div>

<div class="fieldcontain ${hasErrors(bean: answerInstance, field: 'vote', 'error')} required">
	<label for="vote">
		<g:message code="answer.vote.label" default="Vote" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="vote" type="number" value="${answerInstance.vote}" required=""/>
</div>

