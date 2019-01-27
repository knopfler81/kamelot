source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.1'
gem 'rails', '~> 5.2.2'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'cocoon'
gem 'rails-i18n'


#environement variables
gem "figaro"

#payment 
gem 'money-rails'
gem 'stripe'

#notifications 
gem 'twilio-ruby'

#authentication && authorization
gem 'devise'

#styles
gem 'bootstrap', '~> 4.1.3'
gem 'jquery-rails'
gem 'simple_form'
gem 'font-awesome-rails'


gem 'will_paginate', '>= 3.1'
gem 'country_select', require: 'country_select_without_sort_alphabetical'

#uploads images  PDF
gem 'fog'
gem 'carrierwave', '~> 1.2', '>= 1.2.3'
gem 'mini_magick'
gem 'file_validators'


#jobs
gem 'sidekiq'
gem 'sinatra'
gem 'sidekiq-failures', '~> 1.0'


group :development do 
  gem "letter_opener", group: :development
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'better_errors'
end



group :development, :test do
  gem 'rspec-rails', '~> 3.7'
  gem 'launchy'
  gem 'chromedriver-helper'
  gem 'selenium-webdriver'
  gem 'database_cleaner'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'capybara'
  gem 'capybara-webkit', github: 'thoughtbot/capybara-webkit', branch: 'master'
  gem 'rails-controller-testing'
  gem 'capybara-screenshot'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'dotenv-rails'
  gem "factory_bot_rails", "~> 4.0"
  gem 'binding_of_caller'
  gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master'
end


gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]


