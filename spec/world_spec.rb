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

  it "should perform a killing by creating an event and causing actors in the same room to witness it" do
    w = World.new

    r = mock('room', {})
    a1 = mock('killer', {})
    a2 = mock('victim', { :current_room => r})
    a3 = mock('bystander', {})

    r.expects(:occupants).returns([a1, a2, a3])

    expected_event = Event::Killing.new(:originator => a1, :target => a2)

    a1.expects(:witness).with(equals(expected_event))
    a2.expects(:witness).with(equals(expected_event))
    a3.expects(:witness).with(equals(expected_event))



    w.do_killing(a1, a2)
  end
end
