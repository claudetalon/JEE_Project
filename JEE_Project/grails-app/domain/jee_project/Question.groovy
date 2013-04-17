package jee_project

class Question {

	String question
	static hasMany = [answers : Answer]
	Teacher teacher
	int totalVote

	String status

    static constraints = {
		status blank: false, inList: ["closed","opened"]
    }
	
	void vote(){
		
	}
	
	String toString() {
		return question
	}
}
