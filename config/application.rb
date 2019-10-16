require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module InteriorApi
  class Application < Rails::Application
     config.time_zone = 'Kolkata'

      config.active_job.queue_adapter = :delayed_job
    # Initialize configuration defaults for originally generated Rails version.


    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

     config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: [:get, :put, :post, :delete, :options]
      end
    end
    #autoloads lib folder during production
    config.eager_load_paths << Rails.root.join('lib')

    #autoloads lib folder during development
    config.autoload_paths << Rails.root.join('lib')
    # [...]
  end
end




