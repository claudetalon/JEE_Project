package jee_project

abstract class User {

	String name
	String firstname
	String password
	String email
	String sex
	
    static constraints = {
		name(blank:false)
		firstname(blank:false)
		sex inList: ["M", "F"]
		email email: true
    }
	
	String toString() {
		return "Nom : " + name + " Prenom : " + firstname
	}
	
}
