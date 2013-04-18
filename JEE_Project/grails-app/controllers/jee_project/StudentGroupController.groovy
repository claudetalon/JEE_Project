package jee_project

import org.springframework.dao.DataIntegrityViolationException

class StudentGroupController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [studentGroupInstanceList: StudentGroup.list(params), studentGroupInstanceTotal: StudentGroup.count()]
    }

    def create() {
        [studentGroupInstance: new StudentGroup(params)]
    }

    def save() {
        def studentGroupInstance = new StudentGroup(params)
        if (!studentGroupInstance.save(flush: true)) {
            render(view: "create", model: [studentGroupInstance: studentGroupInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'studentGroup.label', default: 'StudentGroup'), studentGroupInstance.id])
        redirect(action: "show", id: studentGroupInstance.id)
    }

    def show(Long id) {
        def studentGroupInstance = StudentGroup.get(id)
        if (!studentGroupInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'studentGroup.label', default: 'StudentGroup'), id])
            redirect(action: "list")
            return
        }

        [studentGroupInstance: studentGroupInstance]
    }

    def edit(Long id) {
        def studentGroupInstance = StudentGroup.get(id)
        if (!studentGroupInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'studentGroup.label', default: 'StudentGroup'), id])
            redirect(action: "list")
            return
        }

        [studentGroupInstance: studentGroupInstance]
    }

    def update(Long id, Long version) {
        def studentGroupInstance = StudentGroup.get(id)
        if (!studentGroupInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'studentGroup.label', default: 'StudentGroup'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (studentGroupInstance.version > version) {
                studentGroupInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'studentGroup.label', default: 'StudentGroup')] as Object[],
                          "Another user has updated this StudentGroup while you were editing")
                render(view: "edit", model: [studentGroupInstance: studentGroupInstance])
                return
            }
        }

        studentGroupInstance.properties = params

        if (!studentGroupInstance.save(flush: true)) {
            render(view: "edit", model: [studentGroupInstance: studentGroupInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'studentGroup.label', default: 'StudentGroup'), studentGroupInstance.id])
        redirect(action: "show", id: studentGroupInstance.id)
    }

    def delete(Long id) {
        def studentGroupInstance = StudentGroup.get(id)
        if (!studentGroupInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'studentGroup.label', default: 'StudentGroup'), id])
            redirect(action: "list")
            return
        }

        try {
            studentGroupInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'studentGroup.label', default: 'StudentGroup'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'studentGroup.label', default: 'StudentGroup'), id])
            redirect(action: "show", id: id)
        }
    }
}
