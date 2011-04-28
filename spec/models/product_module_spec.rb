require File.dirname(__FILE__) + '/../spec_helper'

describe ProductModule do
  it "should be valid" do
    ProductModule.new.should be_valid
  end
end
