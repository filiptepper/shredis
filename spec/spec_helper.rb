require "bundler_setup"
Bundler.require(:default, :test)

require File.join(File.dirname(__FILE__), "..", "shredis.rb")

set :environment, :test