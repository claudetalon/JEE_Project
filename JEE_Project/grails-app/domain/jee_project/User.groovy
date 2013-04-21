package jee_project

abstract class User {

	String name
	String firstname
	String login
	String mdp
	String email
	String sex
	
    static constraints = {
		name(blank:false)
		login(blank:false, nullable:false)
		firstname(blank:false)
		sex inList: ["M", "F"]
		email email: true
    }
	
	String toString() {
		return firstname + " " + name
	}
	
}
