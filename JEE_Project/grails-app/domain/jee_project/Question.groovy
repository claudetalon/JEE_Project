package jee_project

class Question {

	String question
	static hasMany = [answers : Answer]
	Teacher teacher
	int totalVote
	def list
	def Set<Student> voted = []
	
	String status

	static belongsTo = StudentGroup
	
    static constraints = {
		status blank: false, inList: ["closed","opened"]
    }
	
	void voteReponse(Answer a){
		a.vote()
		this.totalVote++
	}
	
	def createListForPiechart() {
		// def myDailyActivitiesData = [['Work', 11], ['Eat', 2],
		//                              ['Commute', 2], ['Watch TV', 2], ['Sleep', 7]]
		List<Answer> list = []
		List<Answer> answers = Answer.findAllByQuestion(this)
		for (Answer a : answers) {
			list += [[a.answer, a.vote]]
		}
		
		this.list= list
		return list
	}
	
	def addToVoted(Student s){	
		this.voted.add(s)
	}
	
	String toString() {
		return question
	}
}
