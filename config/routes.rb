Rails.application.routes.draw do
  
  resources :confirmations
  resources :posts
  devise_for :users
  get 'landing/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Almost every application defines a route for the root path ("/") at the top of this file.
  # root "articles#index"
  root to: 'landing#index'
end
