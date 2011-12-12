require 'spec/spec_helper'

describe CommandParser do
  it "should parse a look action" do
    CommandParser.new("look bob").get_command.should == 
      Command::Look.new("bob")
  end

  it "should parse a kill action" do
    CommandParser.new("kill bill").get_command.should == 
      Command::Kill.new("bill")
  end
end

