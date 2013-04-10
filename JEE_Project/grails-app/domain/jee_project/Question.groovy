package jee_project

class Question {

	String question
	static hasMany = [answers : Answer]
	
    static constraints = {
    }
	
	String toString() {
		return question
	}
}
