class CreateTestEnvironments < ActiveRecord::Migration
  def self.up
    create_table :test_environments do |t|
      t.string :name
      t.string :description
      t.timestamps
    end
  end

  def self.down
    drop_table :test_environments
  end
end
