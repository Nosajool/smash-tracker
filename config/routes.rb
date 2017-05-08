Rails.application.routes.draw do

  root 'matches#index'

  resources :users, only: [:new, :create, :index, :show]
  resources :matches, only: [:new, :create, :index, :show]
  resources :characters, only: [:index, :show]

  get '/compare',     to: 'users#compare'
end
