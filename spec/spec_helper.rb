require 'rspec'
require 'watir'
require 'watir-webdriver'
require 'yaml'

require_relative '../pages/authentication_page'
require_relative '../pages/encrypterUser_page'
require_relative '../pages/encrypterKey_page'

RSpec.configure do |config|
  
   config.before(:all) {
    @browser = Watir::Browser.new :phantomjs
    @browser.driver.manage.timeouts.implicit_wait = 10
    @browser.goto 'http://localhost:4567'
    @login = AuthenticationPage.new @browser
    @encrypter = EncrypterPageUser.new @browser
    @encrypterKey = EncrypterPageKey.new @browser
   }
  # config.before(:each) {}
   config.after(:all) {
    @browser.close unless @browser.nil?
    @browser = nil
   }
  # config.after(:each) {}

  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

 config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end