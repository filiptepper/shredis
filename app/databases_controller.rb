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

    get "/databases/:id/search" do
      @database = Shredder.databases.include?(params[:id]) ? params[:id] : nil

      @query = params[:query]
      @keys = []

      unless @database.nil? || @query.nil?
        @keys = Shredder.keys @query

        redirect "/databases/#{@database}/keys/#{@keys[0]}" if @keys.size == 1
      end

      erb :"databases/search"
    end

  end
end