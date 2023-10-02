Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })

  get("/directors/youngest", { :controller => "directors", :action => "max_dob" })
  get("/directors/eldest", { :controller => "directors", :action => "min_dob" })
  post("/insert_director",{:controller => "directors", :action => "create"})
  post("/update_director/:path_id",{:controller => "directors",:action => "update"})

  get("/directors", { :controller => "directors", :action => "index" })
  get("/directors/:path_id", { :controller => "directors", :action => "show" })
  
  get("/movies", { :controller => "movies", :action => "index" })
  get("/movies/:path_id", { :controller => "movies", :action => "show" })
  post("/insert_movie", {:controller => "movies", :action => "create"})
  get("/actors", { :controller => "actors", :action => "index" })
  get("/actors/:path_id", { :controller => "actors", :action => "show" })
  post("/insert_actor", {:controller => "actors", :action => "add"})
  get("/delete_actor/:path_id",{:controller => "actors", :action => "delete"})
  post("/modify_actor/:path_id", {:controller => "actors", :action => "update"})
end
