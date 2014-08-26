class CreateLots < ActiveRecord::Migration
  def change
    create_table :lots do |t|
      t.string :name, null: false
    end
    add_index :lots, :name, unique: true
  end
end
