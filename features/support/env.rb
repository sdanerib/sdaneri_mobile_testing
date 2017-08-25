require 'rspec'
require 'require_all'
require 'selenium-webdriver'
require 'appium_lib'
require 'page-object'
require_rel 'pages'

World(PageObject::PageFactory)
