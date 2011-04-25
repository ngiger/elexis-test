require 'spec_helper'
describe "LayoutLinks" do
  it "at '/' should have Umgebung" do
    get '/'
    response.should have_selector('div', :content => "Umgebung, um Elexis leichter zu testen")
  end
  
  it "at '/' should have admin" do
    get '/'
    response.should have_selector('div', :content => "Admin")
  end

  it "at '/' should have COSRE" do
    get '/'
    response.should have_selector('div', :content => "COSRE")
  end
end