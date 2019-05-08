require "capybara/rspec"
require 'stripe_mock'

RSpec.configure do |config|

  Capybara.run_server = true

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.example_status_persistence_file_path = 'tmp/rspec_examples.txt'
  config.order = :random
  config.shared_context_metadata_behavior = :apply_to_host_groups 

  config.after(:all) do
    if Rails.env.test? 
      FileUtils.rm_rf(Dir["#{Rails.root}/spec/support/uploads"])
    end 
  end

  config.append_after :each do |example|
    CarrierWave.clean_cached_files!(0)
  end

  config.before(:each) do
      @stripe_test_helper = StripeMock.create_test_helper
      StripeMock.start
    end
  config.after(:each) do
      StripeMock.stop
    end
end
