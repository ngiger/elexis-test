class CreateDeployStates < ActiveRecord::Migration
  def self.up
    create_table :deploy_states do |t|
      t.string :name
      t.string :description
      t.timestamps
    end
  end

  def self.down
    drop_table :deploy_states
  end
end
