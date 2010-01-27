require "rubygems"
require "sinatra"

set :run, false
set :environment, ENV["RACK_ENV"] || "development"

require "shredis"
run Sinatra::Application