require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module CompanyWebsite
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Rome'

    # Never throw exceptions on the web :)
    config.i18n.enforce_available_locales = false
    I18n.enforce_available_locales = false # for gems with eager pre-loading like http_accept_language

    # Set the default locale.
    config.i18n.default_locale = :en

    config.assets.paths << Rails.root.join('app', 'assets', 'fonts')

    config.assets.precompile << Proc.new do |path|
      if path =~ /\.(css|js)\z/
        full_path = Rails.application.assets.resolve(path).to_path
        app_assets_path = Rails.root.join('app', 'assets').to_path
        full_path.starts_with? app_assets_path
      else
        false
      end
    end
  end
end
