package jee_project

class Question {

	String question
	static hasMany = [answers : Answer]
	static belongsTo = Teacher

	String status

    static constraints = {
		status blank: false, inList: ["closed","opened"]
    }
	/*
	void close() {
		this.status = State.closed
	}*/
	
	String toString() {
		return question
	}
}
