require File.expand_path('../boot', __FILE__)

require 'rails/all'

if ENV['RACK_ENV'] == 'heroku'
  Bundler.require(:default, :test, :heroku)
else
  Bundler.require(*Rails.groups)
end

module DemocracyWatcher
  class Application < Rails::Application
    config.i18n.available_locales = [Settings.default_language]
    config.i18n.default_locale = Settings.default_language

    # Middleware to use I18NJS
    config.middleware.use I18n::JS::Middleware
  end
end
