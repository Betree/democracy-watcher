require File.expand_path('../boot', __FILE__)

require 'rails/all'

if ENV['RACK_ENV'] == 'heroku'
  Bundler.require(:default, :test, :heroku)
else
  Bundler.require(*Rails.groups)
end

module DemocracyWatcher
  class Application < Rails::Application
    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    config.i18n.default_locale = Settings.default_language

    # Middleware to use I18NJS
    config.middleware.use I18n::JS::Middleware

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    config.react.addons = true
  end
end
