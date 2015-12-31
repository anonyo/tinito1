Rails.application.routes.draw do

  resources :users, except: [:new]
  resources :products do
    resources :reviews, except: [:show, :index]
  end
  resources :categories

  match "/contact" => "about#new", via: "get", as: "contact_new"
  match "/contact" => "about#create", via: "post", as: "contact"
  get "/signup" => "users#new"
  get "/login" => "sessions#new"
  post "login" => "sessions#create"
  delete "/logout" => "sessions#destroy"
  get "/how-it-works" => "pages#how_it_works"
  get "/faqs" => "pages#faqs"
  get "/cart" => "cart#index"
  get "/cart/clear" => "cart#clearCart"
  get "/cart/:id/" => "cart#add", as: :add_to_cart
  root "pages#home"
end
