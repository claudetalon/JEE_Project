package jee_project

class Student extends User {

	StudentGroup gstudent
	
    static constraints = {
		gstudent(nullable : true)
    }
	
	void vote(Answer a){
		a.vote()
	}
}
