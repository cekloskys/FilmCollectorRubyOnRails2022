Rails.application.routes.draw do
  get "actors" => "actors#index"
  get "actors/new" => "actors#new"
  post "actors" => "actors#create"
  get "movies" => "movies#index"
  get "movies/new" => "movies#new"
  post "movies" => "movies#create"
end
