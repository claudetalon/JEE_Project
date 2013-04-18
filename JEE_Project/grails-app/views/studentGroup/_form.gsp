<%@ page import="jee_project.StudentGroup" %>



<div class="fieldcontain ${hasErrors(bean: studentGroupInstance, field: 'groupName', 'error')} required">
	<label for="groupName">
		<g:message code="studentGroup.groupName.label" default="Group Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="groupName" required="" value="${studentGroupInstance?.groupName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: studentGroupInstance, field: 'questions', 'error')} ">
	<label for="questions">
		<g:message code="studentGroup.questions.label" default="Questions" />
		
	</label>
	<g:select name="questions" from="${jee_project.Question.list()}" multiple="multiple" optionKey="id" size="5" value="${studentGroupInstance?.questions*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: studentGroupInstance, field: 'students', 'error')} ">
	<label for="students">
		<g:message code="studentGroup.students.label" default="Students" />
		
	</label>
	<g:select name="students" from="${jee_project.Student.list()}" multiple="multiple" optionKey="id" size="5" value="${studentGroupInstance?.students*.id}" class="many-to-many"/>
</div>

