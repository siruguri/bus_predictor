require 'simplecov'

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

require 'rails/test_help'
require 'mocha/mini_test'

require 'capybara'
require 'capybara/rails'
require 'capybara/webkit'
require 'minitest/rails/capybara'

Dir[Rails.root.join('test/support/**/*.rb')].each { |f| require f }

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  include FixtureFiles
  include Mongoid::FixtureSet::TestHelper
  self.fixture_path = "#{Rails.root}/test/fixtures"
end

class ActionController::TestCase
  # Let controller test cases open files
  include Mongoid::FixtureSet::TestHelper
  self.fixture_path = "#{Rails.root}/test/fixtures"

  # Some controllers will need Devise
  include Devise::Test::ControllerHelpers 
end

Capybara.configure do |config|
  config.javascript_driver = :webkit
end

class Capybara::Rails::TestCase
  include Warden::Test::Helpers
  Warden.test_mode!
end
