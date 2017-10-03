Rails.application.routes.draw do
  # get 'home/index'

  get '/about', to: 'about#show'

  # resources :about

  resources :posts

  resources :home

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
