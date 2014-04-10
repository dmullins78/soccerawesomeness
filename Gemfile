source 'http://rubygems.org'

ruby '1.9.3'

gem 'rails', '3.2.3'
gem 'timeliness'
gem 'devise'
gem 'jquery-rails'
gem 'rufus-scheduler'

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

group :test, :development do
  gem 'spork', '~> 0.9.0.rc'
  gem 'turn', '0.8.2', :require => false
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'heroku'
end

group :production do
  gem 'pg'
end

group :development do
  gem "better_errors"
end
