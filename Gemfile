# frozen_string_literal: true

source 'https://rubygems.org'

gem 'dotenv-rails', require: 'dotenv/rails-now'

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.0.3', '>= 7.0.3.1'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
# gem "bootsnap", require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

# Database
gem 'discard'
gem 'mysql2'
gem 'sequel-rails'

# Sidekiq
gem 'connection_pool'
gem 'hiredis'
gem 'redis'
gem 'sidekiq'
gem 'sidekiq-scheduler'

# Audit Trails
gem 'paper_trail'

# Authorization
gem 'pundit'

# Pagination
gem 'pagy'
gem 'pagy_cursor'

# JSON Parser
gem 'oj'

# Monitoring
# gem 'appsignal'

# Generating PDFs
# gem 'grover'

# Encryption
gem 'argon2'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'brakeman'
  gem 'bundler-audit', require: false
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'prettier'
  gem 'rspec-rails'
  gem 'rubocop', require: false
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubocop-rails_config'
  gem 'rubocop-rspec', require: false
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
  gem 'active_record_query_trace'
  gem 'solargraph'
  # Use Capistrano for deployment
  gem 'capistrano', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-chruby', require: false
  gem 'capistrano-logger', require: false
  gem 'capistrano-passenger', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-sidekiq', require: false
  gem 'capistrano-slack_notification', require: false
  gem 'oink' # Measure memory used per request
end

group :test do
  gem 'factory_bot_rails'
  gem 'rspec_junit_formatter'
end
