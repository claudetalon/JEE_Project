package jee_project

import org.springframework.dao.DataIntegrityViolationException

class UserController {
	
	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def connect(){
		def teacherInstance = Teacher.findByLoginAndMdp(params["login"], params["password"])
		def studentInstance = Student.findByLoginAndMdp(params["login"], params["password"])
		
		if (teacherInstance == null && studentInstance != null) {
			session['ens'] = false
			session['login'] = studentInstance.login
			redirect(controller : "Student", action: "show", id: studentInstance.id)
		} else if (studentInstance == null && teacherInstance != null) {
			session['ens'] = true
			session['login'] = teacherInstance.login
			redirect(controller : "Teacher", action: "show", id: teacherInstance.id)
		} else {
			flash.message = message(code: 'default.connexion.message')
			render(view : "/login")
		}
	}
	
	def disconnect(){
		session.login = null
		session.ens = false
		render(view : "/login")
	}
	
	def account(){
		redirect(controller : "Student", action : "create")	
	}
	
	def goHome(){
		def teacherInstance = Teacher.findByLogin(session.login)
		def studentInstance = Student.findByLogin(session.login)
		
		if (teacherInstance == null && studentInstance != null) {
			redirect(controller : "Student", action: "show", id: studentInstance.id)
		} else if (studentInstance == null && teacherInstance != null) {
			redirect(controller : "Teacher", action: "show", id: teacherInstance.id)
		}	
	}
	
}
