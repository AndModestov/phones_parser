source 'https://rubygems.org'

ruby '2.3.1'
gem 'rails', '5.0.1'

gem 'sass-rails'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'jbuilder'
gem 'slim-rails'
gem "therubyracer"
gem 'twitter-bootstrap-rails'
gem 'dotenv'
gem 'dotenv-deployment', require: 'dotenv/deployment'
gem 'redis-rails'
gem 'nokogiri'
gem 'typhoeus'
gem 'sidekiq'
gem 'sinatra', '>= 1.3.0', require: nil
gem 'puma'
gem 'uglifier'
gem 'unicorn'

gem 'sdoc', group: :doc

group :development do
  gem 'listen'
  gem 'capistrano', '3.5.0', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-rvm', require: false
  gem 'capistrano-sidekiq', require: false
  gem 'capistrano3-unicorn', require: false
end

group :test, :development do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'launchy'
  # gem 'capybara-webkit'
  gem 'database_cleaner'
end

group :test do
  gem 'shoulda-matchers'
  gem 'json_spec'
  gem 'rails-controller-testing'
end
