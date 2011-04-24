require 'spec_helper'

describe "product_versions/new.html.erb" do
  before(:each) do
    assign(:product_version, stub_model(ProductVersion,
      :name => "MyString",
      :description => "MyString",
      :remarks => "MyText",
      :user_id => 1,
      :deploy_state_id => 1,
      :product_module_id => 1
    ).as_new_record)
  end

  it "renders new product_version form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => product_versions_path, :method => "post" do
      assert_select "input#product_version_name", :name => "product_version[name]"
      assert_select "input#product_version_description", :name => "product_version[description]"
      assert_select "textarea#product_version_remarks", :name => "product_version[remarks]"
      assert_select "input#product_version_user_id", :name => "product_version[user_id]"
      assert_select "input#product_version_deploy_state_id", :name => "product_version[deploy_state_id]"
      assert_select "input#product_version_product_module_id", :name => "product_version[product_module_id]"
    end
  end
end
