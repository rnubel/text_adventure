require 'spec/spec_helper'

describe Room do
  it "should instantiate with arguments" do
    Room.new({}).should_not be_nil
  end

  it "should have a description" do
    r = Room.new(:description => "Test")

    r.description.should == "Test"
  end
end
