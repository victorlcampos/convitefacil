require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Partyvip
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

    ActionView::Base.field_error_proc = proc do |html_tag, instance_tag|
      html = [html_tag.html_safe]

      object = instance_tag.object
      errors_messages = object.errors.full_messages_for(instance_tag.instance_variable_get("@method_name"))
      if errors_messages.any?
        html << '<ul>'.html_safe

        errors_messages.each do |message|
          html << '<li>'.html_safe
          html << message
          html << '</li>'.html_safe
        end

        html << '</ul>'.html_safe
      end

      instance_tag.safe_join(html) # avoid html injection on error message.
    end
  end
end
