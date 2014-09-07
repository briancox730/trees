class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :tree_id
      t.string :name
      t.string :email
      t.string :address
      t.integer :zipcode
      t.string :city
      t.string :state
      t.timestamps
    end
  end
end
