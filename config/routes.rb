Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })

  get("/directors/youngest", { :controller => "directors", :action => "max_dob" })
  get("/directors/eldest", { :controller => "directors", :action => "min_dob" })
  post("/directors/:path_id",{:controller => "directors", :action => "update"})
  post("/directors/:path_id",{:controller => "directors",:action => "create"})

  get("/directors", { :controller => "directors", :action => "index" })
  get("/directors/:path_id", { :controller => "directors", :action => "show" })
  
  get("/movies", { :controller => "movies", :action => "index" })
  get("/movies/:path_id", { :controller => "movies", :action => "show" })
  
  get("/actors", { :controller => "actors", :action => "index" })
  get("/actors/:path_id", { :controller => "actors", :action => "show" })
  post("/insert_actor", {:controller => "actors", :action => "add"})
  get("/delete_actor/:path_id",{:controller => "actors", :action => "delete"})
  post("/modify_actor/:path_id", {:controller => "actors", :action => "update"})
end
