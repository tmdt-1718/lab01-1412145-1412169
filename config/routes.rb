Rails.application.routes.draw do
  # get 'home/index'

  get 'posts/:id/viewcount', to: 'posts#getviewcount'

  get '/about', to: 'about#show'

  get '/signup', to: 'accounts#new'

  post'/signup', to: 'accounts#create'

  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create'
  
  delete '/logout', to: 'sessions#destroy'

  # resources :about

  resources :posts

  resources :accounts

  # resources :home

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
