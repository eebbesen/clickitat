
# frozen_string_literal: true
ENV['RACK_ENV'] = 'test'
require 'minitest/autorun'
require 'rack/test'
require 'minitest/reporters'
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new]
require 'minitest/capybara'

require_relative '../clickitat'

class RackTest < MiniTest::Test
  include Rack::Test::Methods

  def app
    Cuba
  end
end

Capybara.configure do |config|
  config.run_server = false
  config.default_driver = :selenium
  config.app_host = 'http://localhost:9292'
end

class AcceptanceTest < Minitest::Capybara::Test
end
