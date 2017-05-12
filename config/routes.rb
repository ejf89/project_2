Rails.application.routes.draw do

  root to: 'welcome#index'

  get '/signup', to: 'users#new', as: 'signup'

  resources :users do
    resources :pictures, only: [:new, :create, :show, :destroy]
  end

  resources :comments

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  resources :tags, only: [:index, :show]





end
