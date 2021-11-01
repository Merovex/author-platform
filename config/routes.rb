Rails.application.routes.draw do
  resources :announcements
  resources :subscribers
  
  resources :links
  get '/s/:slug', to: 'links#show', as: :short
  
  resources :pages
  resources :errors

  # mount Blazer::Engine, at: "blazer"
  
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

  devise_scope :user do
    get 'confirm-email', to: 'users/sessions#email_confirmed'#, only_path: true
    post 'authenticate-token', to: 'users/sessions#authenticate_token'
  end

  get 'users/all'
  get 'users/show'
  get 'users/me'
  get 'posts/:id/publish' => "posts#publish"
  get "/404" => "errors#not_found"
  get 'landing/index'
  get '/:slug' => "pages#show"
  root to: 'landing#index'
end
