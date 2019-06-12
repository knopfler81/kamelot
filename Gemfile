source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.4'
gem 'rails', '~> 5.2.3'
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

#satistiques
gem "groupdate", "~> 3.1.1"  
gem "chartkick"
gem 'google-api-client', '~> 0.11'


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
gem 'sprockets-rails', :require => 'sprockets/railtie'
gem 'font-awesome-sass', '~> 5.0.9'
gem 'country_select'

gem 'will_paginate'

#uploads images
gem 'fog'
gem 'carrierwave', '~> 1.2', '>= 1.2.3'
gem 'mini_magick'
gem 'file_validators'


#jobs
gem 'sidekiq'
gem 'sidekiq-cron'
gem 'sinatra'
gem 'sidekiq-failures', '~> 1.0'


#react 
gem 'webpacker', '~> 3.5.5' # ⚠️ version qui fonctionne avec flatpickr 
gem 'react-rails'


#PDF 
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary', '~> 0.12.3'

gem "wkhtmltopdf-heroku"

gem 'cookies_eu'


#QR codes 
gem 'rqrcode_png'
gem 'rqrcode'

#Text editor
gem 'summernote-rails', '~> 0.8.10.0'


#contact_form
gem 'mail_form'
gem "recaptcha", require: "recaptcha/rails"



#SEO
gem 'friendly_id', '~> 5.2.4'
gem 'sitemap_generator'

group :development do 
  gem "letter_opener", group: :development
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'better_errors'
end

group :development, :test do
  gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master'
  gem 'stripe-ruby-mock', '~> 2.5.6', :require => 'stripe_mock'
  gem 'timecop'
  gem 'rspec-rails', '~> 3.7'
  gem 'launchy'
  gem 'webdrivers'
  gem 'selenium-webdriver'
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
  gem 'simplecov', require: false #savoir le tx de couverture des tests
end


gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]