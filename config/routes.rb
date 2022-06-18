Rails.application.routes.draw do
  get 'dashboard/' => 'dashboard#index'
  get 'dashboard/pages'
  get 'dashboard/posts'
  get 'dashboard/subscribers' => 'subscriptions#subscribers', as: 'subscribers'
  
  resources :subscriptions
  
  resources :links
  get '/s/:slug', to: 'links#show', as: :short
  
  resources :pages
  resources :errors

  # mount Blazer::Engine, at: "blazer"
  
  resources :series
  resources :authors
  resources :writing_goals do
    resources :writing_entries, path_names: { new: 'new/:date' }
  end
  resources :books do
    resources :praises
    resources :book_links
  end
  resources :posts
  devise_for :users, controllers: {
    sessions: "devise/passwordless/sessions",
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }
  devise_scope :user do
    get "/users/magic_link",
      to: "devise/passwordless/magic_links#show",
      as: "users_magic_link"
  end
  
  get 'subscriptions/:slug/unsub_posts' => "subscriptions#unsub_posts", as: "posts_unsubscribe"
  get 'users/all'
  get 'users/show'
  get 'users/me'
  get 'book/:id/release' => "books#release", as: "book_release"
  get 'posts/:id/publish' => "posts#publish"
  get 'posts/:id/broadcast' => "posts#broadcast", as: "posts_broadcast"
  get "/404" => "errors#not_found"
  get 'landing/index'
  get '/:slug' => "pages#show"
  
  root to: 'landing#index'
end
