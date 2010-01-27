Given /^an empty Redis database$/ do
  Shredder.flushall
end

Given /^Redis database[s]? ([0-9,\s]*)$/ do |databases|
  databases = databases.split(",").map { |database| database.strip }

  Shredder.flushall
  databases.each do |database|
    Shredder.db = database
    Shredder.set "shredder:key:#{database}", "shredder:value:#{database}"
  end
end

Given /^empty Redis database[s]? ([0-9,\s]*)$/ do |databases|
  databases = databases.split(",").map { |database| database.strip }

  Shredder.flushall
  databases.each do |database|
    Shredder.db = database
    Shredder.set "shredder:key:#{database}", "shredder:value:#{database}"
    Shredder.del "shredder:key:#{database}"
  end
end

Given /^Redis string key "([^\"]*)" with value "([^\"]*)"$/ do |key, value|
  Shredder.set key, value
end

Given /^Redis list key "([^\"]*)" with values "([^\"]*)"$/ do |key, values|
  values.split(",").each do |value|
    Shredder.lpush key, value
  end
end

Given /^Redis set key "([^\"]*)" with values "([^\"]*)"$/ do |key, values|
  values.split(",").each do |value|
    Shredder.sadd key, value
  end
end

Given /^Redis sorted set key "([^\"]*)" with values "([^\"]*)"$/ do |key, values|
  values.split(",").each do |value|
    Shredder.zadd key, value, value
  end
end