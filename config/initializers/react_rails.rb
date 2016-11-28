require 'react/server_rendering/sprockets_renderer'

module React
  module ServerRendering
    class I18nJsRenderer < SprocketsRenderer

      def before_render(component_name, props, prerender_options)
        super + "I18n.defaultLocale = '#{DemocracyWatcher::Application.config.i18n.default_locale}'; I18n.fallbacks = true; I18n.locale = '#{I18n.locale}';"
      end

    end
  end
end

Rails.application.config.react.server_renderer = React::ServerRendering::I18nJsRenderer