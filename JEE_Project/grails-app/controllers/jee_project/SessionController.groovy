package jee_project

import org.springframework.dao.DataIntegrityViolationException

class SessionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [sessionInstanceList: Session.list(params), sessionInstanceTotal: Session.count()]
    }

    def create() {
        [sessionInstance: new Session(params)]
    }
	
	def connect(){
		def teacherInstance = Teacher.findByNameAndMdp(params["login"], params["password"])
		def studentInstance = Student.findByNameAndMdp(params["login"], params["password"])
		
		if (teacherInstance == null && studentInstance != null) {
			session['ens'] = false
			session['name'] = studentInstance.name
			redirect(controller : "Student", action: "show", id: studentInstance.id)
		} else if (studentInstance == null && teacherInstance != null) {
			session['ens'] = true
			session['name'] = teacherInstance.name
			redirect(controller : "Teacher", action: "show", id: teacherInstance.id)
		} else {
			redirect(action: "connect")
		}
	}
	
	def account(){	
		System.out.println("Account creation")
		redirect(controller : "Student", action: "create")
	}

    def save() {
        def sessionInstance = new Session(params)
        if (!sessionInstance.save(flush: true)) {
            render(view: "create", model: [sessionInstance: sessionInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'session.label', default: 'Session'), sessionInstance.id])
        redirect(action: "show", id: sessionInstance.id)
    }

    def show(Long id) {
        def sessionInstance = Session.get(id)
        if (!sessionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'session.label', default: 'Session'), id])
            redirect(action: "list")
            return
        }

        [sessionInstance: sessionInstance]
    }

    def edit(Long id) {
        def sessionInstance = Session.get(id)
        if (!sessionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'session.label', default: 'Session'), id])
            redirect(action: "list")
            return
        }

        [sessionInstance: sessionInstance]
    }

    def update(Long id, Long version) {
        def sessionInstance = Session.get(id)
        if (!sessionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'session.label', default: 'Session'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (sessionInstance.version > version) {
                sessionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'session.label', default: 'Session')] as Object[],
                          "Another user has updated this Session while you were editing")
                render(view: "edit", model: [sessionInstance: sessionInstance])
                return
            }
        }

        sessionInstance.properties = params

        if (!sessionInstance.save(flush: true)) {
            render(view: "edit", model: [sessionInstance: sessionInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'session.label', default: 'Session'), sessionInstance.id])
        redirect(action: "show", id: sessionInstance.id)
    }

    def delete(Long id) {
        def sessionInstance = Session.get(id)
        if (!sessionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'session.label', default: 'Session'), id])
            redirect(action: "list")
            return
        }

        try {
            sessionInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'session.label', default: 'Session'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'session.label', default: 'Session'), id])
            redirect(action: "show", id: id)
        }
    }
}
