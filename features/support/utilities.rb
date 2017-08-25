require 'selenium-webdriver'
require 'appium_lib'
require 'yaml'

module Utilities

  def self.get_capabilities(scenario_name)

      descriptor_file_name = "./config/capabilities/#{ENV['CAPABILITIES']}.yml"
      caps = nil

      if File.exist?(descriptor_file_name)
        caps = YAML.load_file(descriptor_file_name)
      else
        fail "The following capabilities descriptor file #{descriptor_file_name} does not exists."
      end

      if ENV['PLATFORM'].downcase.strip == 'automation_web'
        return get_local_web_capabilities(scenario_name, caps)

      else
        return get_local_mobile_capabilities(scenario_name, caps)
      end

  end

  def self.get_local_web_capabilities(scenario_name, caps)
    {
        caps:
        {
            browserName: caps['browser'],
            url:         'www.google.com'
        }
    }

  end

  def self.get_local_mobile_capabilities(scenario_name, caps)

    #'/Users/stephanydaneri/Documents/sdaneri_web_mobile/com.uberspot.a2048_23.apk.zip'
    {
        caps: {
            platformName: caps['platform_name'],
            platformVersion: caps['platform_version'],
            deviceName: caps['device_name'],
            app: (ENV['PLATFORM'] == 'ios')? "#{File.dirname(__FILE__)}/to_be_defined" : "#{File.dirname(__FILE__)}/com.uberspot.a2048_23.apk.zip" ,
            appActivity: 'com.uberspot.a2048.MainActivity',
            appPackage: 'com.uberspot.a2048',
            name: scenario_name,
            chromedriverExecutable: '/usr/local/bin/chromedriver',
            autoGrantPermissions: true,
            autoAcceptAlerts: true
        },
        appium_lib:
            {
                server_url: 'http://127.0.0.1:4723/wd/hub'
            }
    }
  end

  def self.set_mobile_context(appium, context)
    case context
      when :web
        context_name = appium.available_contexts.find { |available_context| available_context.include? 'WEBVIEW' }
      when :native
        context_name = appium.available_contexts.find { |available_context| available_context.include? 'NATIVE_APP' }
      else
        context_name = nil
    end
    appium.set_context(context_name)
  end

end