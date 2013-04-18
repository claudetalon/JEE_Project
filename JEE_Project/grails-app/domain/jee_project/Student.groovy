package jee_project

class Student extends User {

	static belongsTo = StudentGroup
	
    static constraints = {
    }
	
	void vote(Answer a){
		a.incrVote()
	}
}
