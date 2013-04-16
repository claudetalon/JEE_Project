package jee_project

class Teacher extends User {
	
	static hasMany = [questions : Question]
	
    static constraints = {
    }
	
	void createQuestion(String questionContent) {
		
	}
}
