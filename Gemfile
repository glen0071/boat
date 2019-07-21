source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Essentials
ruby '2.6.3'
gem 'rails', '~> 5.2.3'

# Backend
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'

# Frontend
gem 'jbuilder', '~> 2.5'
gem 'sass-rails', '~> 5.0'
gem 'slim-rails', '~> 3.2.0'
gem 'slim', '~> 4.0.1'
gem 'uglifier', '>= 1.3.0'

# Faster
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Testing
  gem 'rspec-rails', '~> 4.0.0.beta2'

  # Debugging
  gem 'pry-rails'
  gem 'pry-remote'
  gem 'pry-byebug', '~> 3.7'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

gem 'simplecov', '~> 0.17.0', require: false, group: :test
