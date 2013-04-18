package jee_project

class Answer {
	
	String answer
	boolean valid = false
	int vote = 0
	Question question
	String comment
	
	
    static constraints = {
		comment(nullable:true)
    }
	
	void vote(){
		vote++
	}
	
	String toString() {
		return answer
	}
}
