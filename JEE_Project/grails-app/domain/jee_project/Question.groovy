package jee_project

class Question {

	String question
	static hasMany = [answers : Answer]
	static belongsTo = Teacher
	/*
	enum State {
		opened,
		closed
	}
	
	State status = State.opened
	*/
    static constraints = {
    }
	/*
	void close() {
		this.status = State.closed
	}*/
	
	String toString() {
		return question
	}
}
