require 'spec_helper'

describe DeployStatesController do
  render_views

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end
end
