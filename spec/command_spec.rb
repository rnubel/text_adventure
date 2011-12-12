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

  it "should apply itself to the world and produce output" do
    c = Command::Look.new("Bob")

    w = stub()
    actor_bob = stub(:name => "Bob")
    w.expects(:find_actor).with("Bob").returns(actor_bob)
    actor_bob.expects(:description).returns("Blah")


    capture_stdout {
      c.execute(w)
    }.should =~ /Blah/

  end
end
