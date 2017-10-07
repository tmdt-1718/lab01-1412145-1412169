Rails.application.routes.draw do
  # get 'home/index'

  get 'posts/:id/viewcount', to: 'posts#getviewcount'

  get '/about', to: 'about#show'
<<<<<<< HEAD
  get '/login', to: 'about#login'
  get '/register', to: 'about#register'
  get '/albums/:album_id/photo/:id', to: 'photos#show'

  resources :posts
  resources :home
  resources :albums do
  	resources :photos
  end
=======

  get '/signup', to: 'accounts#new'

  post'/signup', to: 'accounts#create'

  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create'
  
  delete '/logout', to: 'sessions#destroy'

  # resources :about

  resources :posts

  resources :accounts

  # resources :home
>>>>>>> c54f76a12112e3bc7b7f9ec935835f6332107222

  root 'home#index'
end
