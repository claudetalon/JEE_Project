package jee_project

class Question {

	String question
	static hasMany = [answers : Answer]
	Teacher teacher

	String status

    static constraints = {
		status blank: false, inList: ["closed","opened"]
    }
	
	String toString() {
		return question
	}
}
