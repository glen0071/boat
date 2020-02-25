# frozen_string_literal: true

Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql'
  end
  post '/graphql', to: 'graphql#execute'
  get 'favorites/create'
  get 'favorites/destroy'
  devise_for :users

  get '/search', to: 'search#new'
  post '/search', to: 'search#create'

  resources :data_transfers, only: %i[create new]
  resources :sources
  resources :topics
  resources :authors
  resources :quotes do
    get '/study', to: 'games#hide_words'
    get '/complete', to: 'games#complete_quote'
  end
  resources :users, only: :show

  get '/about', to: 'home#about'
  get '/home', to: 'home#index'
  get '/home/check_admin_user', to: 'home#check_admin_user'
  root 'home#index'

  namespace :admin do
    get '/dashboard', to: 'dashboard#index'
  end

  namespace :api do
    resources :topics, only: [:index]
    resources :quotes, only: %i[index edit]
  end
end
