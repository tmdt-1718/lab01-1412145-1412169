Rails.application.routes.draw do
  # get 'home/index'

  get '/about', to: 'about#show'
  get '/login', to: 'about#login'
  get '/register', to: 'about#register'
  get '/albums/:album_id/photo/:id', to: 'photos#show'

  resources :posts
  resources :home
  resources :albums do
  	resources :photos
  end

  root 'home#index'
end
