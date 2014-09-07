class CreateTrees < ActiveRecord::Migration
  def change
    create_table :trees do |t|
      t.string :name, null: false
      t.integer :height, null: false
      t.integer :price, null: false
    end
  end
end
