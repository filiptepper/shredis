module Shredis
  module KeysController

    get "/databases/:database_id/keys/:id" do
      @database = Shredder.databases.include?(params[:database_id]) ? params[:database_id] : nil
      @key = params[:id]

      unless @database.nil?
        case Shredder.type(@key)

        when "list"
          @value = Shredder.lrange(@key, 0, Shredder.llen(@key) - 1)

        when "set"
          @value = Shredder.smembers(@key)

        when "zset"
          @value = Shredder.zrange(@key, 0, Shredder.zcard(@key) - 1)

        when "string"
          @value = Shredder.get(@key)

        end
      end

      erb :"keys/show"
    end

  end
end