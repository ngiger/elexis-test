require File.dirname(__FILE__) + '/../spec_helper'

describe ProductModulesController do
  render_views

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => ProductModule.first
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    ProductModule.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    ProductModule.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(product_module_url(assigns[:product_module]))
  end

  it "edit action should render edit template" do
    get :edit, :id => ProductModule.first
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    ProductModule.any_instance.stubs(:valid?).returns(false)
    put :update, :id => ProductModule.first
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    ProductModule.any_instance.stubs(:valid?).returns(true)
    put :update, :id => ProductModule.first
    response.should redirect_to(product_module_url(assigns[:product_module]))
  end

  it "destroy action should destroy model and redirect to index action" do
    product_module = ProductModule.first
    delete :destroy, :id => product_module
    response.should redirect_to(product_modules_url)
    ProductModule.exists?(product_module.id).should be_false
  end
end
