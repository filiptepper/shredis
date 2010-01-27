module Shredis
  module DatabasesController

    get "/databases" do
      @databases = Shredder.databases
      erb :"databases/index"
    end

    get "/databases/:id" do
      @database = Shredder.databases.include?(params[:id]) ? params[:id] : nil

      unless @database.nil?
        Shredder.db = @database
        @keys = Shredder.keys "*"
      end

      erb :"databases/show"
    end

  end
end