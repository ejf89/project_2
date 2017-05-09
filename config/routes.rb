Rails.application.routes.draw do


  get '/signup', to: 'users#new', as: 'signup'
  get '/users', to: 'users#index'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'

  # get '/sessions', to: 'sessions#create'
  delete '/users/:id', to: 'sessions#destroy'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'



end
