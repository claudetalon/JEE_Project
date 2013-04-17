package jee_project

class Answer {
	
	String answer
	boolean valid = false
	int vote = 0
	Question question
	
	
    static constraints = {
    }
	
	String toString() {
		return answer
	}
}
