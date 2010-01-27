require File.expand_path(File.join(File.dirname(__FILE__), "vendor", "gems", "environment"))

Dir[File.join(File.dirname(__FILE__), "lib", "*")].each { |file| require file }

require "sinatra"
configure do
  set :views, "#{File.dirname(__FILE__)}/views"
end

before do
  @status = Shredder.info
end

Dir[File.join(File.dirname(__FILE__), "app", "*")].each { |file| load file }

helpers do
  include Shredis::Helpers
end