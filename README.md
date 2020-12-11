# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 2.6.0

* System dependencies
source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.0'
gem 'rails', '~> 6.0.1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'bcrypt', '~> 3.1.7'
gem 'jwt_sessions'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'rack-cors'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]




* Database creation: PostGres

* Database Connection:
default: &default
  adapter: postgresql
  encoding: unicode
  username: postgres
  password: 123456
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  
  test:
  <<: *default
  database: Auth-App_test
  
  production:
  <<: *default
  database: Auth-App_production
  username: Auth-App
  password: <%= ENV['AUTH-APP_DATABASE_PASSWORD'] %>
  

development:
  <<: *default
  database: Auth-App_development




* Services (barcode scanning & product validation)
# Product-Sergeant-BlockChain
# Product-Sergeant-BlockChain
