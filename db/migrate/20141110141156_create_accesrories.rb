class CreateAccesrories < ActiveRecord::Migration
  def change
    create_table :accessories do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.float :price, null: false

      t.timestamps
    end
  end
end
