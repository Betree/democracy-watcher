source 'https://rubygems.org'

gem 'rails', '5.0.0.1'

# Internationalization
gem 'rails-i18n', '~> 4.0.0'
gem 'i18n-js', '>= 3.0.0.rc11'

# For easy config via config/settings.yml file
gem 'config'

# Admin
gem 'rails_admin'
gem 'devise'
gem 'codemirror-rails'
gem 'ckeditor'

# File uploads
gem 'carrierwave'
gem 'mini_magick' # To resize image. imagemagick must be installed

# Easily nest views
gem 'nestive'

# Assets
gem 'sassc-rails' # Use SASS for stylesheets
gem 'uglifier', '>= 1.3.0' # Use Uglifier as compressor for JavaScript assets
gem 'coffee-rails', '~> 4.2.1' # Use CoffeeScript for .coffee assets and others
gem 'haml' # Use HAML for templates
gem 'react-rails' # Use react to generate others
gem 'js-routes' # Make rails routes available in JS
gem 'font-awesome-rails'

gem 'bourbon', '~> 4.2.7' # A simple and lightweight mixin library for Sass
gem 'neat', '~> 1.8.0' # A lightweight, semantic grid framework built with Bourbon

source 'https://rails-assets.org' do
  gem 'rails-assets-animate.css'
  gem 'rails-assets-underscore'
  gem 'rails-assets-momentjs'
  gem 'rails-assets-chartjs'
  gem 'rails-assets-chartkick'
  gem 'rails-assets-js-yaml'
end

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.0'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

group :development, :test, :heroku do
  # To generate test text and images
  gem 'forgery'
end

group :development, :test do
  # Database
  gem 'sqlite3'

  # Testing framework
  gem 'rspec-rails', '~> 3.5'
end

group :test do
  gem 'simplecov'
  gem 'codeclimate-test-reporter', '~> 1.0.0'
end

group :development do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in others
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :heroku do
  gem 'rails_12factor'
  gem 'pg'
  # gem 'fog-aws' # Store uploaded assets on AWS for heroku
end

