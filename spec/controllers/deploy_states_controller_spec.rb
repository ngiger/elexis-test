require File.dirname(__FILE__) + '/../spec_helper'

describe DeployStatesController do
  fixtures :all
  render_views

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => DeployState.first
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    DeployState.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    DeployState.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(deploy_state_url(assigns[:deploy_state]))
  end

  it "edit action should render edit template" do
    get :edit, :id => DeployState.first
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    DeployState.any_instance.stubs(:valid?).returns(false)
    put :update, :id => DeployState.first
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    DeployState.any_instance.stubs(:valid?).returns(true)
    put :update, :id => DeployState.first
    response.should redirect_to(deploy_state_url(assigns[:deploy_state]))
  end

  it "destroy action should destroy model and redirect to index action" do
    deploy_state = DeployState.first
    delete :destroy, :id => deploy_state
    response.should redirect_to(deploy_states_url)
    DeployState.exists?(deploy_state.id).should be_false
  end
end
