Rails.application.routes.draw do
  
  resources :series
  resources :authors
  resources :books do
    resources :praises
  end
  resources :posts
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }
  get 'landing/index'
  root to: 'landing#index'
end
