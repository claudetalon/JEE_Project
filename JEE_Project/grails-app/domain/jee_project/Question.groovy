package jee_project

class Question {

	String question
	static hasMany = [answers : Answer]
	static belongsTo = Teacher

	String status

    static constraints = {
		status blank: false, inList: ["closed","opened"]
    }
	
	String toString() {
		return question
	}
}
