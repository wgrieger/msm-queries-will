Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })
  
  get("/directors", {:controller => "pages", :action =>"all_directors"})
  
  get("/directors/:director_id", {:controller=> "pages", :action => "one_director"})

  get("/directors/youngest", {:controller=> "pages", :action => "youngest_director"})

  get("/directors/eldest", {:controller=> "pages", :action => "eldest_director"})

  get("/actors", {:controller=> "pages", :action => "all_actors"})

  get("/actors/:actor_id", {:controller=> "pages", :action => "one_actor"})

  get("/movies", {:controller=> "pages", :action => "all_movies"})

  get("/movies/:movie_id", {:controller=> "pages", :action => "one_movie"})

end
