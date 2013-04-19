package jee_project

class Session {
	
	String login
	String password
	String role

    static constraints = {
		role blank: false, nullable: true, inList: ["admin","user"]
		login nullable: true
		password nullable: true
    }
}
