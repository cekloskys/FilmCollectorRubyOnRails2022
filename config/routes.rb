Rails.application.routes.draw do
  get "actors" => "actors#index"
  get "actors/new" => "actors#new"
  post "actors" => "actors#create"
end
