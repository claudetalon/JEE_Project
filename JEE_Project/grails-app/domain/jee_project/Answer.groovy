package jee_project

class Answer {
	
	String answer
	boolean valid = false
	int vote = 0
	Question question
	
	
    static constraints = {
    }
	
	void vote(){
		vote++
	}
	
	String toString() {
		return answer
	}
}
