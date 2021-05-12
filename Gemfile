source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.1'

gem 'jbuilder'
gem 'puma'
gem 'rails'
gem 'rails_12factor'
gem 'recaptcha', require: 'recaptcha/rails'
gem 'uglifier'
gem 'webpacker'
gem 'where_exists'

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'dotenv-rails'
  gem 'pry-rails'
  gem 'sqlite3', '~> 1.4'
end

group :development do
  gem 'listen', '~> 3.3'
end
