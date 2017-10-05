Rails.application.routes.draw do
  # get 'home/index'

  get '/about', to: 'about#show'
  # get '/login', to: 'login#login'
  # get '/register', to: 'register#register'
  # get '/albums', to: 'albums#index'
  # get '/albums', to: 'albums#show'
  # post '/albums/new', to: 'albums#new'
  # get '/albums', to: 'albums#index'
  # resources :about

  resources :posts
  resources :home
  
  resources :albums do 
    resources :photos
  end

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
