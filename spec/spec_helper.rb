# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/rails'
require 'capybara/rspec'

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
# ActiveRecord::Migration.maintain_test_schema!
ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|

  config.before(:suite) do
    DatabaseCleaner.clean_with :truncation
    DatabaseCleaner.clean_with :transaction
  end

  config.after(:each) do
    ActionMailer::Base.deliveries.clear
  end

  config.around(:each, type: :feature, js: true) do |ex|
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.start
    self.use_transactional_fixtures = false
    ex.run
    self.use_transactional_fixtures = true
    DatabaseCleaner.clean
  end

  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
  
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explictly tag your specs with their type, e.g.:
  #
  #     describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/v/3-0/docs
  config.infer_spec_type_from_file_location!

  config.treat_symbols_as_metadata_keys_with_true_values = true

  # use different browser for capybara testing
  # https://sakib.wordpress.com/2015/10/25/cucumbercapybara-run-tests-on-firefox-chrome-safari/
  # http://collectiveidea.com/blog/archives/2011/09/27/use-chrome-with-cucumber-capybara/
  # Capybara.register_driver :chrome do |app|
  #   Capybara::Selenium::Driver.new(app, :browser => :chrome)
  # end
  #
  # Capybara.javascript_driver = :chrome  

  # use a specific version of browser (in this case, Firefox; 47, 48 and 49 don't seem to work with selenium driver)
  # http://blog.pixarea.com/2013/02/locking-the-firefox-version-when-testing-rails-with-capybara-and-selenium/
  # http://releases.mozilla.org/pub/firefox/releases/46.0/
  Capybara.register_driver :selenium do |app|
    require 'selenium/webdriver'
    Selenium::WebDriver::Firefox::Binary.path = "/Users/davidvezzani/Downloads/firefox-46.0.mac-x86_64/firefox-sdk/bin/Firefox.app/Contents/MacOS/firefox"
    Capybara::Selenium::Driver.new(app, :browser => :firefox)
  end  
end
