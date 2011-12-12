require 'spec/spec_helper'

describe Room do
  it "should instantiate" do
    Room.new.should_not be_nil
  end
end
