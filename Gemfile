source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Essentials
ruby '2.6.5'
gem 'rails', '~> 5.2.3'

# Backend
gem 'devise', '~> 4.6.2'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'seedbank', '~> 0.5.0'
gem 'graphql', '~> 1.10.1'

# Frontend
gem 'active_model_serializers', '~> 0.10.10'
gem 'responders'
gem 'sass-rails', '~> 5.0'
gem 'slim-rails', '~> 3.2.0'
gem 'slim', '~> 4.0.1'
gem 'uglifier', '>= 1.3.0'
gem 'webpacker', '~> 4.x'
gem "font-awesome-rails"

# Faster
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do

  # Deployment
  gem 'capistrano',         require: false
  gem 'capistrano-rbenv', '~> 2.1', require: false
  gem 'capistrano-rails',   require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano3-puma',   require: false

  # Testing
  gem 'factory_bot_rails', '~> 5.0.2'
  gem 'rspec-rails', '~> 4.0.0.beta2'
  gem 'shoulda', '~> 3.6.0'

  # Debugging
  gem 'pry-rails'
  gem 'pry-remote'
  gem 'pry-byebug', '~> 3.7'
end

group :development do
  # Debugging
  gem 'better_errors'
  gem 'binding_of_caller'

  # Testing
  gem 'guard-rspec', '~> 4.7.3', require: false

  # Work faster
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'graphiql-rails'
end

gem 'simplecov', '~> 0.17.0', require: false, group: :test

gem 'graphiql-rails', group: :development