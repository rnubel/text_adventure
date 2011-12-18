require 'spec/spec_helper'

class TestCommand
  include Command::Base
end

describe Command::Base do
  it "should instantiate with a target" do
    c = TestCommand.new("blar")

    c.target.should == "blar"
  end
end

describe Command::Look do
  it "should instantiate with a target" do
    c = Command::Look.new("blar")

    c.target.should == "blar"
  end

  it "should look at an actor in the current room" do
    c = Command::Look.new("Bob")

    r = mock()
    w = stub(:player => stub(:current_room => r))
    actor_bob = stub(:name => "Bob")
    w.expects(:find_actor_in_room).with("Bob", r).returns(actor_bob)
    actor_bob.expects(:description).returns("Blah")


    capture_stdout {
      c.execute(w)
    }.should =~ /Blah/
  end

  it "should look at the room if target is not given" do
    c = Command::Look.new

    w = mock(:player => mock(:current_room => mock(:description => "It's a room.")))
    
    capture_stdout {
      c.execute(w)
    }.should =~ /It's a room./
  end

  it "should handle the case when the target is not found" do
    c = Command::Look.new("Bob")

    r = mock()
    w = stub(:player => stub(:current_room => r))
    w.expects(:find_actor_in_room).with("Bob", anything).returns(nil)

    capture_stdout {
      c.execute(w)
    }.should =~ /don't see anyone/

  end
end

describe Command::Move do
  it "should instantiate with a direction" do
    c = Command::Move.new("north")

    c.target.should == "north"
  end

  it "should try to move in the given direction" do
    c = Command::Move.new("north")
    p = mock(:move_in_direction)
    p.stubs(:current_room).returns mock(:description => "New room")
    w = stub(:player => p)

    capture_stdout {
      c.execute(w)
    }
  end

  it "should display the new room's description" do
    c = Command::Move.new("north")
    p = stub(:move_in_direction)
    w = stub(:player => p)
    p.expects(:current_room).at_least_once.returns mock(:description => "New room")

    capture_stdout {
      c.execute(w)
    }.should =~ /New room/
  end

end
