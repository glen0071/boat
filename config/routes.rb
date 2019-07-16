Rails.application.routes.draw do
  resources :subjects
  resources :authors
  resources :quotes

  get '/about', to: 'home#about'
  root 'home#index'
end
