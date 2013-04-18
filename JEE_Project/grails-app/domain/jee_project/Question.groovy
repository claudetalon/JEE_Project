package jee_project

class Question {

	String question
	static hasMany = [answers : Answer]
	Teacher teacher
	int totalVote

	String status

	static belongsTo = StudentGroup
	
    static constraints = {
		status blank: false, inList: ["closed","opened"]
    }
	
	void voteReponse(Answer a){
		a.vote()
		this.totalVote++
	}
	
	String toString() {
		return question
	}
}
