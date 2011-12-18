require 'spec/spec_helper'

describe Event::Murder do
  it "should instantiate with a originator and target" do
    a1 = mock()
    a2 = mock()
    e = Event::Murder.new(:originator => a1,
                          :target     => a2)

    e.originator.should == a1
    e.target.should == a2
  end
end
