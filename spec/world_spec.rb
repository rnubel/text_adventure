require 'spec/spec_helper'

describe World do
  it "should create a new world" do
    w = World.new
    w.should_not be_nil
  end

  it "should add actors and find by name" do
    w = World.new
    actor = stub(:name => "Bill")

    w.add_actor(actor)

    w.find_actor("Bill").should == actor
  end

  it "should have a current room" do
    w = World.new
    r = mock()

    w.current_room = r

    w.current_room.should == r
  end
end
