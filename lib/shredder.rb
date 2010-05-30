class Shredder
  class << self
    #Hack for ruby < 1.9
    def type(key)
      method_missing(:type, key)
    end

    def method_missing(method, *args, &block)
      instance.send(method, *args, &block)
    end

    def db=(database)
      @@config[:db] = database
      @@redis = initialize_redis
    end

    def databases
      info.find_all { |key, value| key.to_s =~ /db([0-9]+)/ }.collect { |database| database[0].to_s.match(/db([0-9]+)/)[1] }
    end

  private

    def instance
      @@redis ||= initialize_config && initialize_redis
    end

    def initialize_config
      @@config = {}
      @@config.merge YAML::load_file(File.join(ROOT_DIR, "config", "redis.yml"))[Sinatra::Application.environment.to_s || "development"]
    end

    def initialize_redis
      Redis.new @@config
    end

  end
end

class Redis
  def get(key)
    call_command [:get, key]
  end
end