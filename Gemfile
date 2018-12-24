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

#authentication && authorization
gem 'devise'
gem 'pundit'


#styles
gem 'bootstrap', '~> 4.1.3'
gem 'jquery-rails'


group :development, :test do
 	gem 'rspec-rails', '~> 3.7'
	gem 'launchy'
	gem "chromedriver-helper"
  gem 'selenium-webdriver'
  gem 'database_cleaner'
	gem 'shoulda-matchers', '~> 3.1'
	gem 'capybara'
  gem 'capybara-webkit', github: 'thoughtbot/capybara-webkit', branch: 'master'
  gem 'rails-controller-testing'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'dotenv-rails'
  gem "better_errors"
  gem "binding_of_caller"
end


gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]


