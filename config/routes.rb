Rails.application.routes.draw do
  get 'home/index'

  get '/about', to: 'about#show'
  get '/login', to: 'about#login'
  get '/register', to: 'about#register'

  get '/albums/:album_id/photo/:id', to: 'photos#show'

  resources :posts
  resources :albums do
  	resources :photos
  end
  

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
