class CreateProductVersions < ActiveRecord::Migration
  def self.up
    create_table :product_versions do |t|
      t.string :name
      t.string :description
      t.text :remarks
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :product_versions
  end
end
