require 'spec/spec_helper'

describe Room do
  it "should instantiate with arguments" do
    Room.new({}).should_not be_nil
  end

  it "should have a description" do
    r = Room.new(:description => "Test")

    r.description.should == "Test"
  end

  it "should have a list of occupants" do
    a = mock() #actor
    r = Room.new(:description => "Test",
                 :occupants => [a])
  
    r.occupants.should == [a]
  end

  it "should find an actor inside of it" do
    a1 = mock(:name => "Bill") #actor
    a2 = mock(:name => "Bob") #actor
    r = Room.new(:description => "Test",
                 :occupants => [a1, a2])
  
    r.find_actor("Bob").should == a2
  end

  it "should include occupants in its description" do
    a = mock(:name => "Bill") #actor
    r = Room.new(:description => "Test",
                 :occupants => [a])

    r.description.should == "Test\n\nBill is standing here." 
  end
end
