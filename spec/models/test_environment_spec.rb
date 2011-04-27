require File.dirname(__FILE__) + '/../spec_helper'

describe TestEnvironment do
  it "should be valid" do
    TestEnvironment.new.should be_valid
  end
end
