ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |file| require file }

def login_as(user)
  @user = User.create(email: 'admin@example.com', password: 'password', admin: true)
  visit new_user_session_path
  fill_in "user[email]", with: "admin@example.com"
  fill_in "user[password]", with: "password"
  click_on 'Log In'
end


RSpec.configure do |config|
  config.include Devise::Test::IntegrationHelpers, type: :request
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

Capybara.javascript_driver = :webkit

Capybara::Webkit.configure do |config|
  config.block_unknown_urls
end