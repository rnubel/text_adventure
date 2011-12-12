require 'spec/spec_helper'

describe Actor do
  it "should be created with a name" do
    a = Actor.new("Bill")

    a.name.should == "Bill"
  end


end
