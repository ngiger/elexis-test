require File.dirname(__FILE__) + '/../spec_helper'

describe DeployState do
  it "should be valid" do
    DeployState.new.should be_valid
  end
end
