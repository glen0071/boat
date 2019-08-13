Rails.application.routes.draw do

  devise_for :users, skip: :registrations
  get '/search', to: 'search#new'
  post '/search', to: 'search#create'
  resources :data_transfers, only: [:create, :new]
  resources :topics
  resources :authors
  resources :quotes

  get '/about', to: 'home#about'
  get '/home', to: 'home#index'
  root 'home#index'
end
