# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Essentials
ruby '3.0.2'
gem 'rails', '~> 7.0.1'

# Backend
gem 'devise'
gem 'pg'
gem 'puma'
gem 'seedbank'

# Frontend
gem 'active_model_serializers'
gem 'font-awesome-rails'
gem 'react-rails'
gem 'webpacker'
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
  gem 'listen'
  gem 'spring', '~> 3.0.0'
end

gem 'simplecov'
