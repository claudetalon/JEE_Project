package jee_project

class Answer {
	
	String answer
	static belongsTo = Question
	
    static constraints = {
    }
	
	String toString() {
		return answer
	}
}
