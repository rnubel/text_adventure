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

  it "should have a current player" do
    w = World.new
    p = mock()

    w.player = p

    w.player.should == p
  end

  it "should find an actor in given room by name" do
    w = World.new
    a = mock()
    r = mock()
    r.expects(:find_actor).with("Bob").returns(a)

    w.find_actor_in_room("Bob", r).should == a
  end

end
