import jee_project.Answer
import jee_project.Question
import jee_project.Student
import jee_project.Teacher
import jee_project.User

class BootStrap {

    def init = { servletContext ->
		
		def s1 = new Student(firstname : "Claude",
			name : "Talon",
			mdp : "admin",
			sex : "M",
			email : "claude.talon@gmail.com").save(failOnError:true)
			
			
		def s2 = new Student(firstname : "Loic",
			name : "Martinez",
			mdp : "admin",
			sex : "M",
			email : "loic.martinux@gmail.com").save(failOnError:true)
			
			
		def t1 = new Teacher(firstname : "Frederic",
			name : "Migeon",
			mdp : "admin",
			sex : "M",
			email : "frederic.migeon@gmail.com").save(failOnError:true)
	
		def q1 = new Question(question : "Quelle heure est-il ?",
			teacher : Teacher.findByNameAndFirstname("Migeon", "Frederic"),
			status: "opened").save(failOnError:true)
			
		def q2 = new Question(question : "Quel temps fait-il ?",
			teacher : Teacher.findByNameAndFirstname("Migeon", "Frederic"),
			status: "opened").save(failOnError:true)
			
		
		def a1 = new Answer(answer : "Il fait beau.",
			question : Question.findByQuestion("Quel temps fait-il ?")).save(failOnError:true)
		def a2 = new Answer(answer : "Il pleut.",
			question : Question.findByQuestion("Quel temps fait-il ?")).save(failOnError:true)
		def a3 = new Answer(answer : "Il fait froid.",
			question : Question.findByQuestion("Quel temps fait-il ?")).save(failOnError:true)
		def a4 = new Answer(answer : "Il est 14H00",
			question : Question.findByQuestion("Quel temps fait-il ?")).save(failOnError:true)
		
		
    }
    def destroy = {
    }
}
