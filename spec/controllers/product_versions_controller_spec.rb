require 'spec_helper'

describe ProductVersionsController do
  render_views

  describe "GET 'index'" do
    
    describe "for non-signed-in users" do
      it "should deny access" do
        get :index
        response.should redirect_to(signin_path)
        flash[:notice].should =~ /sign in/i
      end
    end
    
  end
  it "should have tests for GET 'edit'"
  it "should have tests for GET 'new'"
  it "should have tests for GET 'index'"
  it "should have tests for POST 'create'"
  it "should have tests for PUT 'update'"
  it "should have tests for DELETE 'destroy'"

end