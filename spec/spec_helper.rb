# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/rspec'
require 'capybara/rails'


Capybara.javascript_driver = :webkit


# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Checks for pending migrations before tests are run.
ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|

  load "#{Rails.root}/db/seeds.rb"

  # this configuration for capybara, function such as: visit, click, etc
  config.include Capybara::DSL
  config.include Devise::TestHelpers, :type => :controller

  # this configuration to use *_path
  config.include Rails.application.routes.url_helpers


end
