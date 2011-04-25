require "spec_helper"

describe ProductVersionsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/product_versions" }.should route_to(:controller => "product_versions", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/product_versions/new" }.should route_to(:controller => "product_versions", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/product_versions/1" }.should route_to(:controller => "product_versions", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/product_versions/1/edit" }.should route_to(:controller => "product_versions", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/product_versions" }.should route_to(:controller => "product_versions", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/product_versions/1" }.should route_to(:controller => "product_versions", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/product_versions/1" }.should route_to(:controller => "product_versions", :action => "destroy", :id => "1")
    end

  end
end
