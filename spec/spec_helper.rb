require File.join(File.dirname(__FILE__), "..", "shredis.rb")

require "sinatra"
require "spec"

set :environment, :test