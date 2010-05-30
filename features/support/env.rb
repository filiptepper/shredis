require app_file = File.join(File.dirname(__FILE__), *%w[.. .. shredis.rb])

# Force the application name because polyglot breaks the auto-detection logic.
Sinatra::Application.app_file = app_file
Sinatra::Application.environment = :test

require "spec/expectations"
require "test/unit"
require "webrat"
require "rack/test"

Webrat.configure do |config|
  config.mode = :rack
end

class MyWorld
  include Test::Unit::Assertions
  include Rack::Test::Methods
  include Webrat::Methods
  include Webrat::Matchers

  Webrat::Methods.delegate_to_session :response_code, :response_body

  def app
    Sinatra::Application
  end
end

World{MyWorld.new}