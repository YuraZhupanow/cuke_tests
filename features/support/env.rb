# frozen_string_literal: true

require 'dotenv/load'
require 'capybara/cucumber'
require 'require_all'
require 'rspec/expectations'
require 'pry'
require 'selenium-webdriver'
require 'site_prism'

require_all 'page_objects/sections'
require_all 'page_objects/pages'
require_all 'models'

if ENV['HEADLESS'] == 'true'
  require 'headless'

  headless = Headless.new
  headless.start

  at_exit do
    headless.destroy
  end
end

def options
  Selenium::WebDriver::Chrome::Options.new(args: %w[window-size=1800,1000])
end

Capybara.default_driver = :selenium
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end
