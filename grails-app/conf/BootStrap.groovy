import moviequotes.Moviequote

class BootStrap {

    def init = { servletContext ->
        Moviequote moviequote0=new Moviequote(movie:"The Godfather",quote:"\"I'm going to make him an offer he can't refuse.\"", role:"Don Corleone");
        Moviequote moviequote1=new Moviequote(movie:"Bloodsport",quote:"\"Very Good. But brick not hit back!\"", role:"");
        Moviequote moviequote2=new Moviequote(movie:"-",quote:"\"Let off some steam, Bennett!\"", role:"Matrix");
        Moviequote moviequote3=new Moviequote(movie:"-",quote:"\"He's been ... trained to eat things that would make a billygoat puke.\"", role:"Colonel Trautman");
        Moviequote moviequote4=new Moviequote(movie:"-",quote:"\"I must beak you.\"", role:"-");

        moviequote0.save();
        moviequote1.save();
        moviequote2.save();
        moviequote3.save();
        moviequote4.save();


    }
    def destroy = {
    }
}
