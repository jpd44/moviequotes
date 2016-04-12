package moviequotes

class Moviequote {
    String movie
    String quote
    String role


    static constraints = {
        movie (blank:true,nullable:true,size:1..50)
        quote(blank:true,nullable:true,size:1..300)
        role (blank:true,nullable:true,size:1..50)
    }
}
