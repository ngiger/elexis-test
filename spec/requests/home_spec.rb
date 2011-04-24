require 'spec_helper'
describe "LayoutLinks" do
  it "at '/' should have Elexis Test" do
    get '/'
    response.should have_selector('div', :content => "Elexis Test")
  end
  
  it "at '/' should have admin" do
    get '/'
    response.should have_selector('div', :content => "Admin")
  end

  it "at '/' should have Demo-Anwendung" do
    get '/'
    response.should have_selector('div', :content => "Demo-Anwendung")
  end
end