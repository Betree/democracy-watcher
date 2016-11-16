JsRoutes.setup do |config|
  config.exclude = [/(.*)admin(.*)/, /^rails(.*)/]
end