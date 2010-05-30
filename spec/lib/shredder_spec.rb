require File.dirname(__FILE__) + "/../spec_helper"

describe Shredder do

  after :each do
    Shredder.class_variable_set :@@redis, nil
  end

  it "raises an exception when no config file is found" do
    YAML.stub!(:load_file).with(any_args()).and_raise(Errno::ENOENT)
    lambda { Shredder.info }.should raise_error(Errno::ENOENT)
  end

  it "returns current server settings" do
    Shredder.info.should include("redis_version")
  end

  it "raises an exception when method is not implemented in redis gem" do;
    lambda { Shredder.so_not_implemented }.should raise_error(RuntimeError)
  end

  it "returns list of databases" do
    Shredder.flushall

    Shredder.db = 3
    Shredder.set "A", "B"

    Shredder.db = 5
    Shredder.set "B", "C"

    Shredder.databases.length.should == 2
    Shredder.databases.should include("3")
    Shredder.databases.should include("5")
  end

end