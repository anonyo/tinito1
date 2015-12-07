Rails.application.routes.draw do

  resources :users, except: [:new]
  resources :products
  get "/signup" => "users#new"
  get "/login" => "sessions#new"
  post "login" => "sessions#create"
  delete "/logout" => "sessions#destroy"
  root "pages#home"
end
