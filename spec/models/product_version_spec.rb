require File.dirname(__FILE__) + '/../spec_helper'

describe ProductVersion do
  before(:each) do
    @attr = {
    :name => "2.1.s",
    :description => "Demo",
    :remarks => "Bemerkung",
    }
  end

  it "should create a new instance given valid attributes" do
    ProductVersion.create!(@attr)
  end
  
  it "should be valid" do
    ProductVersion.new.should be_valid
  end
end
