class CreateAvailableTrees < ActiveRecord::Migration
  def change
    create_table :available_trees do |t|
      t.integer :lot_id, null: false
      t.integer :tree_id, null: false
    end
  end
end
