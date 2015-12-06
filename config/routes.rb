Rails.application.routes.draw do

  root "pages#home"
  resources :users
  resources :products
end
