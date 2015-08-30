source 'https://rubygems.org'

#•Add pry-rails to Gemfile 
gem 'pry-rails', :group => :development

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
# Use sqlite3 as the database for Active Record

gem 'bootstrap-sass'

#attributes will be rendered in Markdown
gem 'redcarpet'

#installing image uploading software
gem 'carrierwave'
gem 'cloudinary'

# to manipulate images
gem 'mini_magick'

#makes uploading to S3 easier
gem 'fog'
gem "figaro"

#separate out pages of posts and topics
gem 'will_paginate', '~> 3.0.5'


group :production do
  gem 'pg'
  gem 'rails_12factor'
  gem 'puma', group: :production
end

group :development do
  gem 'sqlite3'
end
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
#  Faker to help generate development data automatically
gem 'faker'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  #gem to authenticate Bloccit's users
  
  #testing frameworks for Rails
  gem 'rspec-rails', '~> 3.0'
  
  #provides a library to test web applications by simulating how a real user would interact with them
  gem 'capybara'
  
  #performance tracking tool
  gem 'newrelic_rpm'
  
  #tools that make object creation in tests easier
  gem 'factory_girl_rails', '~> 4.0'
  
  
  gem 'thin', group: :development

end

  gem 'devise'
  #gem that makes it easier to authorize different users for different tasks in your app
  gem 'pundit'