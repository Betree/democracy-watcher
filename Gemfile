source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.0.0.1'

# Internationalization
gem 'rails-i18n', '~> 4.0.0'
gem 'i18n-js', '>= 3.0.0.rc11'

# For easy config via config/settings.yml file
gem 'config'

gem 'rails_admin'
gem 'carrierwave'
gem 'mini_magick' # To resize image. imagemagick mus be installed

# Assets
gem 'sassc-rails' # Use SASS for stylesheets
gem 'uglifier', '>= 1.3.0' # Use Uglifier as compressor for JavaScript assets
gem 'coffee-rails', '~> 4.2.1' # Use CoffeeScript for .coffee assets and others
gem 'haml' # Use HAML for templates
gem 'react-rails' # Use react to generate others
gem 'js-routes' # Make rails routes available in JS

gem 'bourbon', '~> 4.2.7' # A simple and lightweight mixin library for Sass
gem 'neat', '~> 1.8.0' # A lightweight, semantic grid framework built with Bourbon

source 'https://rails-assets.org' do
  gem 'rails-assets-font-awesome'
  gem 'rails-assets-animate.css'
  gem 'rails-assets-underscore'
  gem 'rails-assets-chartjs'
end

gem 'active_link_to'

gem 'devise'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.0'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in others
  gem 'web-console', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  # Database - Use sqlite3 in dev, postgres in test
  gem 'sqlite3'
  # To generate test text and images
  gem 'lorem_ipsum_amet'
end

group :heroku do
  gem 'rails_12factor'
  gem 'pg'
end

