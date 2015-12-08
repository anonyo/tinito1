Rails.application.routes.draw do

  resources :users, except: [:new]
  resources :products
  resources :categories
  get "/signup" => "users#new"
  get "/login" => "sessions#new"
  post "login" => "sessions#create"
  delete "/logout" => "sessions#destroy"
  root "pages#home"
end
