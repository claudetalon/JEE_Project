package jee_project

class Teacher extends User {
	
	static hasMany = [questions : Question, groups : StudentGroup]
	
    static constraints = {
    }
	
	void createQuestion(String questionContent) {
		
	}
}
