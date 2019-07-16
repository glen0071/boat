Rails.application.routes.draw do
  resources :quotes
  
  root 'home#index'
end
