Rails.application.routes.draw do

  resources :data_transfers, only: [:create, :new]
  resources :themes
  resources :authors
  resources :quotes

  get '/about', to: 'home#about'
  root 'quotes#index'
end
