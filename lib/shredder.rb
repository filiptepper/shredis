require "redis"

class Shredder

  def self.method_missing(method, *args, &block)
    self.instance.send method, *args, &block
  end


  def self.db=(database)
    @@config[:db] = database
    @@redis = initialize_redis
  end


  def self.databases
    self.info.find_all { |key, value| key.to_s =~ /db([0-9]+)/ }.collect { |database| database[0].to_s.match(/db([0-9]+)/)[1] }
  end


  private


  def initialize; end;

  def self.instance
    @@redis ||= initialize_config && initialize_redis
  end

  def self.initialize_config
    @@config = {}
    @@config.merge YAML::load_file(File.join(File.dirname(__FILE__), "..", "redis.yml"))[Sinatra::Application.environment.to_s || "development"]
  end

  def self.initialize_redis
    Redis.new @@config
  end

end

class Redis
  def get(key)
    call_command [:get, key]
  end
end