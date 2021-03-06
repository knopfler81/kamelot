require_relative 'boot'

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"

Bundler.require(*Rails.groups)

module Kamelot
  class Application < Rails::Application

    config.x.features.send_sms         = ENV["APP_SEND_SMS"].present?
    config.x.features.stats            = ENV["APP_WITH_STATS"].present?
    config.x.features.main_categories  = ENV["APP_WITH_MAIN_CAT"].present?

    config.load_defaults 5.2
    config.active_job.queue_adapter = :sidekiq

    config.action_dispatch.default_headers.merge!('Cache-Control' => 'no-store, no-cache')
    config.generators.system_tests = nil
  end
end
