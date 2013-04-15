package jee_project

import java.util.List;

class Teacher extends User {
	
	
	List<Question> question

    static constraints = {
    }
	
	void createQuestion(String questionContent){
		question.add(new Question(question : questionContent))
	}
}
