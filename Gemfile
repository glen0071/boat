# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Essentials
ruby '3.0.2'
gem 'rails'

# Backend
gem 'devise'
gem 'graphql'
gem 'pg'
gem 'puma'
gem 'seedbank'

# Frontend
gem 'active_model_serializers'
gem 'font-awesome-rails'
gem 'sass-rails'
gem 'slim'
gem 'slim-rails'
gem 'uglifier'

# Faster
gem 'bootsnap'

group :development, :test do
  # Testing & Code Quality
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'shoulda'
  gem 'rubocop'

  # Debugging
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'pry-remote'
end

group :development do
  # Debugging
  gem 'better_errors'
  gem 'binding_of_caller'

  # Testing
  gem 'guard-rspec'

  # Work faster
  gem 'graphiql-rails'
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
end

gem 'simplecov'
