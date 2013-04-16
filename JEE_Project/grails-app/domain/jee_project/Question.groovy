package jee_project

class Question {

	String question
	enum State {
		opened,
		closed
	}

	State status = State.opened
	
	static hasMany = [answers : Answer]
	static belongsTo = Teacher
	
    static constraints = {
    }
	
	void close() {
		this.status = State.closed
	}
	
	String toString() {
		return question
	}
}
