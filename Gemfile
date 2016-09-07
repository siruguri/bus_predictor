source 'https://rubygems.org'
gem 'mongoid',  github: 'mongodb/mongoid', tag: 'v6.0.0.rc0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0'
# Use Puma as the app server
gem 'puma'
# Use SCSS for stylesheets
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails'
gem 'haml-rails'

# Everybody gotta have some jQuery (UI) and Bootstrap!
gem 'jquery-ui-rails'
gem 'bootstrap-sass'
gem 'jquery-rails'

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks'

gem 'redis-namespace'
gem 'sidekiq'
# Required for sidekiq monitoring
gem 'sinatra', :require => nil
gem 'devise'

group :development, :test do
  gem 'pry'
  gem 'pry-byebug'
end

group :test do
  gem 'capybara-webkit'
  gem 'mocha'
  gem 'simplecov', require: false
  gem 'minitest-spec-rails'
  gem 'minitest-rails-capybara'
  gem 'mongoid-fixture_set', github: 'wittawasw/mongoid-fixture_set', branch: 'rails5'
end  

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
