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

  it "should move rooms" do
    a = Actor.new("Bill")
    r1 = mock(:remove_actor => nil)
    r2 = mock(:add_actor => nil)
    a.current_room = r1

    a.move_to(r2)

    a.current_room.should == r2
  end

  it "should move in a direction" do
    a = Actor.new("Bill")
    r2 = mock()
    r1 = stub(:exits => {"north" => r2})
    a.current_room = r1

    a.expects(:move_to).with(r2)

    a.move_in_direction("north")
  end

  describe "witnessing events" do
    before :each do
      @a = Actor.new("Bill")
    end

    it "should witness an event, convert it to an action, and react to that action" do
      event = mock()
      action = mock()

      @a.expects(:get_action_for).with(event).returns(action)
      @a.reactive_self.expects("react_to!").with(action)

      @a.witness(event) 
    end
  end

  describe "helper methods" do
    it "should look up the Reactive::Entity associated with any given Actor" do
      a = Actor.new("Alice")
      b = Actor.new("Bob")
      c = Actor.new("Charles")

      e = a.send('get_entity_for', b)
      e2 = a.send('get_entity_for', c)

      e.should_not == e2
    end

    it "should save and retrieve reactive entities per actor" do
      a = Actor.new("Alice")
      b = Actor.new("Bob")

      e = a.send('get_entity_for', b)
      e2 = a.send('get_entity_for', b)

      e.should == e2
    end

    it "should return nil as an entity for a nil actor" do
      a = Actor.new("Alice")

      a.send('get_entity_for', nil).should == nil
    end

    it "should convert Event::Killing to Reactive::Action::Murder" do
      a = Actor.new("Bob")
      event = Event::Killing.new
      action = a.send('get_action_for', event)

      action.should_not be_nil
      action.should be_a Reactive::Actions::Murder
    end
  end
end
