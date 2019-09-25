require 'cucumber'
require 'pry'
require 'rspec/expectations'
require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'
require 'faker'
require_relative '../lib/pages/farm_drop_app'

Before do
  Capybara.register_driver :site_prism do |app|
    browser = ENV['browser'].to_sym
    Capybara::Selenium::Driver.new(app, cabrowser: browser)
  end

  Capybara.configure do |config|
    config.default_driver = :site_prism
    config.app_host = 'https://staging-web.farmdrop.com'
  end
  
  @app = Pages::FarmDrop.new
end

After do
  Capybara.current_session.driver.quit
end