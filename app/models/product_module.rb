class ProductModule < ActiveRecord::Base
  attr_accessible :name, :description, :license_type_id
end
