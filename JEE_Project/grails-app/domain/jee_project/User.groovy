package jee_project

class User {

	String nom
	String prenom
	List<Question> question
	
    static constraints = {
    }
	
	String toString() {
		return "Nom : " + nom + " Prenom : " + prenom
	}
}
