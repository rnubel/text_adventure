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

  it "should include exits in its description" do
    a = mock(:name => "Bill") #actor
    r = Room.new(:description => "Test",
                 :occupants => [a])
    r.exits["north"] = Room.new

    r.description.should == "Test\n\nBill is standing here.\n\nThere is an exit to the north." 
  end

  it "should add an occupant" do
    a = stub()
    b = stub()
    r = Room.new(:occupants => [a])

    r.add_actor(b)

    r.occupants.should =~ [a, b]
  end

  it "should remove an occupant" do
    a = stub()
    r = Room.new(:occupants => [a])

    r.remove_actor(a)

    r.occupants.should =~ []
  end

  it "should instantiate with an empty exits hash" do
    r = Room.new
    r.exits.should == {}
  end

  it "should have exits as a hash of direction => room" do
    r = Room.new
    r2 = Room.new
    r.exits = {"north" => r2}

    r.exits["north"].should == r2
  end
end
