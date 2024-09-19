# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Essentials
ruby '3.1.2'
gem 'rails', '~> 7.0.1'

# Backend
gem 'devise'
gem 'ferrum'
gem 'pdf-reader'
gem 'pg'
gem 'puma', '~> 5.6.7'
gem 'seedbank'

# Frontend
gem 'active_model_serializers'
gem 'react-rails'
gem 'sass-rails'
gem 'slim'
gem 'slim-rails'
gem 'uglifier'
gem 'webpacker'

# Faster
gem 'bootsnap'

group :development, :test do
  # Testing & Code Quality
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'rubocop'
  gem 'shoulda'

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
