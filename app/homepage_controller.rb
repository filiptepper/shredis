module Shredis
  module HomepageController

    get "/" do
      if Shredder.databases.length == 1
        redirect "/databases/#{Shredder.databases[0]}"
      else
        redirect "/databases"
      end
    end

  end
end