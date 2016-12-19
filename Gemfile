source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
gem "audited-activerecord", "4.2.0"
# Use sqlite3 as the database for Active Record
gem 'mysql2', '0.3.18'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# locking sprockets-rails to the latest 2.X version should be enough for the workaround
# to get teaspoon assets into the pipeline (tests)
gem 'sprockets-rails', '~> 2.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  #gem 'web-console'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  #gem 'spring'
end

gem 'omniauth'
gem 'omniauth-facebook', '1.4.0'

gem "cancan"

# http://angular-rails.com/
gem 'sass'
group :test, :development do
  gem "rspec-rails"
  gem "factory_girl_rails"

  # https://github.com/copiousfreetime/launchy
  # save_and_open_page
  gem "launchy" 

  gem "capybara"
  gem "database_cleaner"
  gem "selenium-webdriver"
  gem 'teaspoon-jasmine'
  gem 'phantomjs'  
end

gem 'bower-rails'

# gem "foreman"
# group :production, :staging do
#   gem "rails_12factor"
#   gem "rails_stdout_logging"
#   gem "rails_serve_static_assets"
# end

gem 'angular-rails-templates'

# https://github.com/plataformatec/simple_form#usage
gem 'simple_form'
gem 'country_select'

gem "cocoon"

gem 'bundler', '>= 1.8.4'

gem 'draper'
