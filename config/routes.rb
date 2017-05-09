Rails.application.routes.draw do



  get '/signup', to: 'users#new', as: 'signup'
  get '/users', to: 'users#index'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'
  delete '/users/:id', to: 'sessions#destroy'


  resources :users do
    resources :pictures, only: [:new, :create, :show, :destroy]
  end

  resources :comments

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'





end
