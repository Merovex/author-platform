Rails.application.routes.draw do
  resources :answers
  resources :questions do
    resources :answers
  end
  resources :comments

  resources :todolists, shallow: true do
    resources :todos
    resources :comments
  end
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
  end
  resources :authors
  resources :buckets do
    resources :writing_entries, path_names: { new: 'new/:date' }
    resources :todolists
  end
  get 'books/admin' => 'books#admin'
  resources :books do
    resources :praises
    resources :book_links
    member do
      patch :move
    end
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

  end
  notify_to :users

  get 'subscriptions/:slug/unsub_posts' => 'subscriptions#unsub_posts', as: 'posts_unsubscribe'
  get 'users/all'
  get 'users/show'
  get 'users/me'
  get 'book/:id/release' => 'books#release', as: 'book_release'
  get 'posts/:id/publish' => 'posts#publish'
  get 'posts/:id/broadcast' => 'posts#broadcast', as: 'posts_broadcast'
  get '/404' => 'errors#not_found'
  get 'static/index'

  get '/about' => 'static#about'
  get '/diceware' => 'static#diceware'
  get '/privacy' => 'static#privacy'
  get '/terms' => 'static#terms'

  get '/:slug' => 'pages#show'

  root to: 'landing#index'
end
