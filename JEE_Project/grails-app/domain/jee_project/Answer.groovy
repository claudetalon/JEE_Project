package jee_project

class Answer {
	
	String answer
	boolean valid = false
	int vote = 0
	Question question
	String comment
	int totalVote = 0
	
	
    static constraints = {
		comment(nullable:true)
    }
	
	void vote(){
		vote++
		totalVote = 0
		List<Answer> answers = Answer.findAllByQuestion(question)
		for (Answer a : answers) {
			totalVote += a.vote
		}
	}
	
	String toString() {
		return answer
	}
}
