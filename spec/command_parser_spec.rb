require 'spec/spec_helper'

describe CommandParser do
  it "should parse a look action" do
    CommandParser.new("look bob").get_action.should == 
      Command::Look.new("bob")
  end

  it "should parse a kill action" do
    CommandParser.new("kill bill").get_action.should == 
      Command::Kill.new("bill")
  end
end

