Rails.application.routes.draw do

  resources :users, except: [:new]
  resources :products
  resources :categories
  match "/contact" => "about#new", via: "get", as: "contact_new"
  match "/contact" => "about#create", via: "post", as: "contact"
  get "/signup" => "users#new"
  get "/login" => "sessions#new"
  post "login" => "sessions#create"
  delete "/logout" => "sessions#destroy"
  root "pages#home"
end
