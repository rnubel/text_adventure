require 'spec/spec_helper'

describe Event::Killing do
  it "should instantiate with a originator and target" do
    a1 = mock()
    a2 = mock()
    e = Event::Killing.new(:originator => a1,
                          :target     => a2)

    e.originator.should == a1
    e.target.should == a2
  end

  it "should compare" do
    a1 = mock()
    a2 = mock()
    e1 = Event::Killing.new(:originator => a1,
                          :target     => a2)
    e2 = Event::Killing.new(:originator => a1,
                          :target     => a2)

    e1.should == e2
  end
end
