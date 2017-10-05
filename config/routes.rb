Rails.application.routes.draw do
  # get 'home/index'

  get '/about', to: 'about#show'

  get '/signup', to: 'accounts#new'

  post'/signup', to: 'accounts#create'

  # resources :about

  resources :posts

  resources :accounts

  # resources :home

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
