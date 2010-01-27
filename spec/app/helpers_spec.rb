require File.dirname(__FILE__) + "/../spec_helper"

describe Shredis::Helpers do
  include Shredis::Helpers

  describe "time_distance" do

    it "returns seconds" do
      time_distance(1).should == "1 second"
      time_distance(2).should == "2 seconds"
      time_distance(59).should == "59 seconds"
    end

    it "returns minutes" do
      time_distance(60).should == "1 minute"
      time_distance(61).should == "1 minute 1 second"
      time_distance(62).should == "1 minute 2 seconds"
      time_distance(120).should == "2 minutes"
      time_distance(181).should == "3 minutes 1 second"
    end

    it "returns hours" do
      time_distance(3600).should == "1 hour"
      time_distance(3601).should == "1 hour 1 second"
      time_distance(3602).should == "1 hour 2 seconds"
      time_distance(3660).should == "1 hour 1 minute"
      time_distance(3661).should == "1 hour 1 minute 1 second"
      time_distance(3662).should == "1 hour 1 minute 2 seconds"
      time_distance(3721).should == "1 hour 2 minutes 1 second"
      time_distance(3722).should == "1 hour 2 minutes 2 seconds"
      time_distance(7200).should == "2 hours"
      time_distance(7201).should == "2 hours 1 second"
      time_distance(7202).should == "2 hours 2 seconds"
      time_distance(7260).should == "2 hours 1 minute"
      time_distance(7261).should == "2 hours 1 minute 1 second"
      time_distance(7262).should == "2 hours 1 minute 2 seconds"
      time_distance(7321).should == "2 hours 2 minutes 1 second"
      time_distance(7322).should == "2 hours 2 minutes 2 seconds"
    end

    it "returns days" do
      time_distance(86400).should == "1 day"
      time_distance(86401).should == "1 day 1 second"
      time_distance(86402).should == "1 day 2 seconds"
      time_distance(86460).should == "1 day 1 minute"
      time_distance(86461).should == "1 day 1 minute 1 second"
      time_distance(86462).should == "1 day 1 minute 2 seconds"
      time_distance(86521).should == "1 day 2 minutes 1 second"
      time_distance(86522).should == "1 day 2 minutes 2 seconds"
      time_distance(90000).should == "1 day 1 hour"
      time_distance(90060).should == "1 day 1 hour 1 minute"
      time_distance(90061).should == "1 day 1 hour 1 minute 1 second"
      time_distance(90062).should == "1 day 1 hour 1 minute 2 seconds"
      time_distance(90121).should == "1 day 1 hour 2 minutes 1 second"
      time_distance(90122).should == "1 day 1 hour 2 minutes 2 seconds"
      time_distance(93600).should == "1 day 2 hours"
      time_distance(93660).should == "1 day 2 hours 1 minute"
      time_distance(93661).should == "1 day 2 hours 1 minute 1 second"
      time_distance(93662).should == "1 day 2 hours 1 minute 2 seconds"
      time_distance(93721).should == "1 day 2 hours 2 minutes 1 second"
      time_distance(93722).should == "1 day 2 hours 2 minutes 2 seconds"
      time_distance(172800).should == "2 days"
      time_distance(172801).should == "2 days 1 second"
      time_distance(172802).should == "2 days 2 seconds"
      time_distance(172860).should == "2 days 1 minute"
      time_distance(172861).should == "2 days 1 minute 1 second"
      time_distance(172862).should == "2 days 1 minute 2 seconds"
      time_distance(172921).should == "2 days 2 minutes 1 second"
      time_distance(172922).should == "2 days 2 minutes 2 seconds"
      time_distance(176400).should == "2 days 1 hour"
      time_distance(176460).should == "2 days 1 hour 1 minute"
      time_distance(176461).should == "2 days 1 hour 1 minute 1 second"
      time_distance(176462).should == "2 days 1 hour 1 minute 2 seconds"
      time_distance(176521).should == "2 days 1 hour 2 minutes 1 second"
      time_distance(176522).should == "2 days 1 hour 2 minutes 2 seconds"
      time_distance(180000).should == "2 days 2 hours"
      time_distance(180060).should == "2 days 2 hours 1 minute"
      time_distance(180061).should == "2 days 2 hours 1 minute 1 second"
      time_distance(180062).should == "2 days 2 hours 1 minute 2 seconds"
      time_distance(180121).should == "2 days 2 hours 2 minutes 1 second"
      time_distance(180122).should == "2 days 2 hours 2 minutes 2 seconds"
    end

  end

  describe "file_size" do

    it "returns KB" do
      file_size(1024).should == "1.00 KB"
      file_size(1536).should == "1.50 KB"
      file_size(8200).should == "8.01 KB"
    end

    it "returns MB" do
      file_size(1048576).should == "1.00 MB"
      file_size(1572864).should == "1.50 MB"
      file_size(8399999).should == "8.01 MB"
    end

    it "returns GB" do
      file_size(1073741824).should == "1.00 GB"
      file_size(1610612736).should == "1.50 GB"
      file_size(8599934592).should == "8.01 GB"
    end

  end

end