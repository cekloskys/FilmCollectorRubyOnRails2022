# each route consists of 3 parts: 1. HTTP method, 2. URL to web page
# view being requested, 3. name of Ruby class and method envoked when
# URL to web page view is requested.
Rails.application.routes.draw do
  # When a get request is made for the actors URL, 
  # Rails envokes the index method in the actors Ruby CONTROLLER class.  
  # Rails automatically maps the index method to a web page VIEW named 
  # index.html.erb and serves that web page to the browser where it’s 
  # rendered.
  # get is used when you want to get a resource.
  get "actors" => "actors#index"
  get "actors/new" => "actors#new"
  # When a post request is made for the actors URL, 
  # Rails envokes the create method in the actors Ruby CONTROLLER class. 
  # post is used when you want to get a resource.
  post "actors" => "actors#create"
  get "movies" => "movies#index"
  get "movies/new" => "movies#new"
  post "movies" => "movies#create"
  get "actors/:id" => "actors#show"
  get "movies/:id" => "movies#show"
  get "actors/:id/edit" => "actors#edit"
  # When a patch request is made for the actors/:id URL, 
  # Rails envokes the update method in the actors Ruby CONTROLLER class.  
  # patch is used when you want to update a resource.
  patch "actors/:id" => "actors#update"
  get "actors/:id/delete" => "actors#delete"
  post "actors/:id" => "actors#destroy"
  get "movies/:id/edit" => "movies#edit"
  patch "movies/:id" => "movies#update"
  get "movies/:id/delete" => "movies#delete"
  post "movies/:id" => "movies#destroy"
  get "appearances" => "appearances#index"
  post "appearances" => "appearances#create"
end
