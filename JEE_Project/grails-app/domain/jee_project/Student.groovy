package jee_project

class Student extends User {

	
    static constraints = {
    }
	
	void vote(Answer a){
		a.incrVote()
	}
}
