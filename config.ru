require "bundler_setup"
Bundler.require(:default)

set :run, false
set :environment, ENV["RACK_ENV"] || "development"

require "shredis"
run Sinatra::Application