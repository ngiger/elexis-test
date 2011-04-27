class ProductVersion < ActiveRecord::Base
  attr_accessible :name, :description, :remarks, :user_id, :deploy_state_id, :product_module_id
end
