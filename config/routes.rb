Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })
  
  get("/directors", {:controller => "pages", :action =>"all_directors"})
  
  get("/directors/:director", {:controller=> "pages", :action => "one_director"})

  get("/actors", {:controller=> "pages", :action => "all_actors"})

  get("/actors/:actor", {:controller=> "pages", :action => "one_actor"})

  get("/movies", {:controller=> "pages", :action => "all_movies"})

  get("/directors/:director", {:controller=> "pages", :action => "one_director"})
end
