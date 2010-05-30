require "shredis"

set :run, false
set :environment, ENV["RACK_ENV"] || "development"

run Sinatra::Application