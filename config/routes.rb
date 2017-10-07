
Rails.application.routes.draw do
  # get 'home/index'

  get 'posts/:id/viewcount', to: 'posts#getviewcount'

  get '/about', to: 'about#show'
  get '/login', to: 'about#login'
  get '/register', to: 'about#register'
  get '/albums/:album_id/photo/:id', to: 'photos#show'

  resources :posts
  resources :home
  resources :albums do
    resources :photos
  end


  get '/signup', to: 'accounts#new'

  post'/signup', to: 'accounts#create'

  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create'
  
  delete '/logout', to: 'sessions#destroy'


  resources :accounts


  root 'home#index'
