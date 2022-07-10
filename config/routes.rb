Rails.application.routes.draw do
  resources :teams do
    resources :todolists
  end
  resources :memberships
  resources :notifications
  resources :features
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :answers
  resources :questions do
    resources :answers
    get '404', to: 'errors#not_found'
    get '422', to: 'errors#unacceptable'
    get '500', to: 'errors#internal_error'
  end
  resources :comments

  resources :todolists, shallow: true do
    resources :todos do
      resources :comments#, shallow: true
    end
    resources :comments
    get '404', to: 'errors#not_found'
    get '422', to: 'errors#unacceptable'
    get '500', to: 'errors#internal_error'
  end
  # resources :comments

  put 'todo/:id/complete' => 'todos#complete', format: :turbo_stream, as: 'complete_todo'
  post 'todo/:id/toolbar' => 'todos#toolbar', format: :turbo_stream, as: 'todo_toolbar'
  get 'dashboard/' => 'dashboard#index'
  get 'atom.xml' => 'xml#atom', format: :xml, as: :atom
  get 'sitemap.xml' => 'xml#sitemap', format: :xml, as: :sitemap

  get 'dashboard/subscribers' => 'subscriptions#subscribers', as: 'subscribers'

  resources :subscriptions

  resources :links
  get '/s/:slug', to: 'links#show', as: :short
  get '/landing/:book_id', to: 'books#show', as: 'landing'

  resources :pages
  resources :errors

  # mount Blazer::Engine, at: "blazer"

  resources :series do
    resources :books, only: %i[new create edit update]
    get '404', to: 'errors#not_found'
    get '422', to: 'errors#unacceptable'
    get '500', to: 'errors#internal_error'
  end
  resources :authors
  resources :projects do
    resources :writing_entries, path_names: { new: 'new/:date' }
    resources :todolists
    get '404', to: 'errors#not_found'
    get '422', to: 'errors#unacceptable'
    get '500', to: 'errors#internal_error'
  end
  get 'books/admin' => 'books#admin'
  resources :books do
    resources :praises
    resources :book_links
    member do
      patch :move
      get '404', to: 'errors#not_found'
      get '422', to: 'errors#unacceptable'
      get '500', to: 'errors#internal_error'
    end
    get '404', to: 'errors#not_found'
    get '422', to: 'errors#unacceptable'
    get '500', to: 'errors#internal_error'
  end
  resources :praises

  get 'posts/admin' => 'posts#admin'
  resources :posts
  devise_for :users, controllers: {
    sessions: 'devise/passwordless/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }
  devise_scope :user do
    get '/users/magic_link',
        to: 'devise/passwordless/magic_links#show',
        as: 'users_magic_link'

    get '404', to: 'errors#not_found'
    get '422', to: 'errors#unacceptable'
    get '500', to: 'errors#internal_error'
  end
  notify_to :users
  get 'users/unsubscribe/:unsubscribe_hash/:subscription' => 'emails#unsubscribe', as: 'unsubscribe'

  get 'users/all'
  get 'users/show'
  get 'users/me'
  get 'book/:id/release' => 'books#release', as: 'book_release'
  get 'posts/:id/publish' => 'posts#publish'
  get 'posts/:id/broadcast' => 'posts#broadcast', as: 'posts_broadcast'
  get 'static/index'

  get '/about' => 'static#about'
  get '/diceware' => 'static#diceware'
  get '/fullclock' => 'static#fullclock'
  get '/privacy' => 'static#privacy'
  get '/terms' => 'static#terms'

  root to: 'landing#index'
  get '404', to: 'errors#not_found', as: 'not_found'
  get '422', to: 'errors#unacceptable'
  get '500', to: 'errors#internal_error'
  get '/robots.txt' => 'static#robots'
  get '/:slug', via: :all, to: 'errors#not_found'
end
