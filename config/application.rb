# frozen_string_literal: true

require_relative 'boot'
require 'dotenv'
require 'rails'
require 'active_record/railtie'
require 'action_cable/engine'
Dotenv.load('.env')

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
groups =
  if ENV.fetch('DEPLOYMENT_ENVIRONMENT', nil) == 'development'
    Rails.groups.append(:development)
  else
    Rails.groups
  end

Bundler.require(*groups)

if ENV.fetch('DEPLOYMENT_ENVIRONMENT', nil) == 'development' &&
   ENV.fetch('RAILS_ENV', nil) == 'development'
  Dotenv.overload('.env', '.env.staging')
elsif ENV.fetch('DEPLOYMENT_ENVIRONMENT', nil) == 'development' &&
      ENV.fetch('RAILS_ENV', nil) != 'development'
  Dotenv.overload('.env', ".env.#{ENV.fetch('RAILS_ENV', nil)}")
end

module BaseApiOnlyProject
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.

    config.api_only = true
    config.encoding = 'utf-8'
    config.time_zone = 'UTC'
    config.i18n.default_locale = :en
    config.eager_load_paths << Rails.root.join('lib')

    # Sequel
    config.sequel.schema_format = :ruby
    config.sequel.load_database_tasks = :sequel
    config.sequel.allow_missing_migration_files = true
    config.sequel.test_connect = true
    config.sequel.after_new_connection = proc do |db|
      db.query('SET GLOBAL MAX_EXECUTION_TIME=5000;')
    end

    config.sequel.after_connect = proc do
      Sequel::Model.plugin :timestamps, update_on_create: true
    end
  end
end
