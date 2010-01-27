module NavigationHelpers
  def path_to(page_name)
    case page_name

    when /the homepage/
      "/"

    when /the list of databases/
      "/databases"

    when /the page of database's ([0-9]*) key "([^"]+)"/
      "/databases/#{$1}/keys/#{$2}"

    when /the page of database ([0-9]*)/
      "/databases/#{$1}"

    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(NavigationHelpers)
