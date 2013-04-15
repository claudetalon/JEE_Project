import jee_project.Student
import jee_project.Teacher
import jee_project.User

class BootStrap {

    def init = { servletContext ->
		
		def s1 = new Student(firstname : "Claude",
			name : "Talon",
			sex : "M",
			email : "claude.talon@gmail.com").save(failOnError:true)
			
			
		def s2 = new Student(firstname : "Loic",
			name : "Martinez",
			sex : "M",
			email : "loic.martinux@gmail.com").save(failOnError:true)
			
			
		def t1 = new Teacher(firstname : "Frederic",
			name : "Migeon",
			sex : "M",
			email : "frederic.migeon@gmail.com").save(failOnError:true)
	
    }
    def destroy = {
    }
}
