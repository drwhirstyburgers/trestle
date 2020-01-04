require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Trestle
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'

    # All asset requests should be to rails prefixed assets paths
    # serverd from the asset pipeline (e.g.: "/assets/*" by default)
    resource "#{Rails.application.config.assets.prefix}/*",
      # Allow any request headers to be sent in the asset request
      # https://developer.mozilla.org/en-US/docs/Web/HTTP/Access_control_CORS#Access-Control-Allow-Headers
      headers: :any,
      # All asset fetches should be via GET
      # Support OPTIONS for pre-flight requests
      # https://developer.mozilla.org/en-US/docs/Web/HTTP/Access_control_CORS#Preflighted_requests
      methods: [:get, :options]
  end
end
