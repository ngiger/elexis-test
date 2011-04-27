require 'spec_helper'

describe LicenseType do
  it "should be valid" do
    LicenseType.new.should be_valid
  end
end
