# frozen_string_literal: true

Rails.application.routes.draw do
  get 'latest/index', as: :latest
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
    get '/study', to: 'games#study_quote'
    get '/guess_quote', to: 'games#study_quote'
    get '/fill_blanks', to: 'games#study_quote'
  end
  resources :users, only: :show

  resources :quote_topics, only: :update

  get '/about', to: 'home#about'
  get '/home', to: 'home#index'
  get '/home/check_admin_user', to: 'home#check_admin_user'
  root 'home#index'

  namespace :admin do
    get '/dashboard', to: 'dashboard#index'
  end


  # A Different app!
  resources :moo_tasks
  get '/moo_tasks/:id/done', to: 'moo_tasks#update', as: :moo_the_moo

end
