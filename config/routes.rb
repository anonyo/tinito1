Rails.application.routes.draw do

  root "pages#home"
  resources :users, except: [:new]
  resources :products
  get "/signup" => "users#new"
end
