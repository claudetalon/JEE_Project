package jee_project

class StudentGroup {
	
	static hasMany = [students : Student, questions : Question]
	static belongsTo = Teacher
	
	String groupName
	
    static constraints = {
		groupName (blank:false)
    }
	
	String toString() {
		return groupName
	}
}
