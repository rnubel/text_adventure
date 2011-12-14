require 'spec/spec_helper'

describe Actor do
  it "should be created with a name" do
    a = Actor.new("Bill")

    a.name.should == "Bill"
  end

  it "should have a current description" do
    a = Actor.new("Bill")

    a.should respond_to(:description)
  end

  it "should instantiate a Reactive::Self when created" do
    a = Actor.new("Bill")

    a.reactive_self.should be_a(Reactive::Self)
  end

  it "should be in a room" do
    a = Actor.new("Bill")
    r = mock()

    a.current_room = r

    a.current_room.should == r
  end
end
