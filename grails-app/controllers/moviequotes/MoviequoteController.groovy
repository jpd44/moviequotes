package moviequotes



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class MoviequoteController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Moviequote.list(params), model:[moviequoteInstanceCount: Moviequote.count()]
    }

    def show(Moviequote moviequoteInstance) {
        respond moviequoteInstance
    }

    def create() {
        respond new Moviequote(params)
    }

    @Transactional
    def save(Moviequote moviequoteInstance) {
        if (moviequoteInstance == null) {
            notFound()
            return
        }

        if (moviequoteInstance.hasErrors()) {
            respond moviequoteInstance.errors, view:'create'
            return
        }

        moviequoteInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'moviequote.label', default: 'Moviequote'), moviequoteInstance.id])
                redirect moviequoteInstance
            }
            '*' { respond moviequoteInstance, [status: CREATED] }
        }
    }

    def edit(Moviequote moviequoteInstance) {
        respond moviequoteInstance
    }

    @Transactional
    def update(Moviequote moviequoteInstance) {
        if (moviequoteInstance == null) {
            notFound()
            return
        }

        if (moviequoteInstance.hasErrors()) {
            respond moviequoteInstance.errors, view:'edit'
            return
        }

        moviequoteInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Moviequote.label', default: 'Moviequote'), moviequoteInstance.id])
                redirect moviequoteInstance
            }
            '*'{ respond moviequoteInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Moviequote moviequoteInstance) {

        if (moviequoteInstance == null) {
            notFound()
            return
        }

        moviequoteInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Moviequote.label', default: 'Moviequote'), moviequoteInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'moviequote.label', default: 'Moviequote'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
