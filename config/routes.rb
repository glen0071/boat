# frozen_string_literal: true

Rails.application.routes.draw do
  get 'carceral_data/hennepin'
  get 'carceral_data/hennepin_bail_amounts'
  get 'carceral_data/in_jail_now'
  get 'carceral_data/admin'
  resources :jail_bookings

  get 'latest/index', as: :latest
  devise_for :users

  get '/search', to: 'search#new'
  post '/search', to: 'search#create'

  resources :authors
  resources :mn_data
  resources :blog_posts
  resources :data_transfers, only: %i[create new]
  resources :favorites, only: %i[update]
  resources :quotes
  resources :quote_topics, only: :update
  resources :sources
  resources :topics
  resources :users, only: :show

  get '/quotes/:id/learn', to: 'quotes#learn', as: :learn
  get '/quotes_home', to: 'quotes#home'
  get '/boat', to: 'quotes#home'

  get '/about-boat', to: 'quotes#about'
  get '/home', to: 'home#index'
  get '/home/check_admin_user', to: 'home#check_admin_user'
  root 'home#index'

  namespace :admin do
    get '/dashboard', to: 'dashboard#index'
  end

  # A Different app!
  get '/moo_tasks/plain', to: 'moo_tasks#plain'
  resources :moo_tasks
  get '/moo_tasks/:id/done', to: 'moo_tasks#update', as: :moo_the_moo
  get '/moo_tasks/:id/hide', to: 'moo_tasks#update', as: :hide_the_moo
end
