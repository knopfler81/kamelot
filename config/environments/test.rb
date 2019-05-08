Rails.application.configure do

  config.cache_classes = true

  config.eager_load = false

  config.public_file_server.enabled = true
  config.public_file_server.headers = {
    'Cache-Control' => "public, max-age=#{1.hour.to_i}"
  }

  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  config.action_dispatch.show_exceptions = false

  config.action_controller.allow_forgery_protection = false

  config.active_storage.service = :test

  config.action_mailer.perform_caching = false

  config.action_mailer.delivery_method = :test

  config.active_support.deprecation = :stderr

  config.action_mailer.default_url_options =  { :host => 'localhost:3000' } 

  config.i18n.default_locale = :fr

  ActionMailer::Base.smtp_settings = {

    address:              "smtp.sendgrid.net",
    port:                  587,
    user_name:             ENV['SENDGRID_USERNAME'],
    password:              ENV['SENDGRID_PASSWORD'],
    authentication:        "plain",
    domain:                "heroku.com",
    enable_starttls_auto:  true

  }

end
