Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  get 'favorites/create'
  get 'favorites/destroy'
  devise_for :users, skip: :registrations

  get '/search', to: 'search#new'
  post '/search', to: 'search#create'

  resources :data_transfers, only: [:create, :new]
  resources :sources
  resources :topics
  resources :authors
  resources :quotes
  resources :users, only: :show

  get '/about', to: 'home#about'
  get '/home', to: 'home#index'
  root 'home#index'

  namespace :admin do
    get '/dashboard', to: 'dashboard#index'
  end

  namespace :api do
    resources :topics, only: [:index]
    resources :quotes, only: [:index, :edit]
  end
end
