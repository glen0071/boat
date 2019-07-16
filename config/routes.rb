Rails.application.routes.draw do
  resources :authors
  resources :quotes
  
  root 'home#index'
end
