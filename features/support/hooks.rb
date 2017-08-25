require 'selenium-webdriver'
require 'appium_lib'
require 'page-object'

Before('@run_web') do |scenario|
  puts "Starting Web Execution for scenario: #{scenario.name}"
  @browser = Selenium::WebDriver.for :chrome
  @browser.get "http://google.com"
end

Before('@run_android, @run_ios') do |scenario|
  @capabilities = Utilities.get_capabilities(scenario.name)
  puts "Starting Mobile Execution for scenario: #{scenario.name}"

  @appium = Appium::Driver.new(@capabilities)
  Appium.promote_appium_methods RSpec::Core::ExampleGroup
  @appium.start_driver
  Utilities.set_mobile_context(@appium, :native)
end

After('@run_web') do
  @browser.close
end

After('@run_android, @run_ios') do
  @appium.driver_quit
end