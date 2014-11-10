class CreateAccessoriesOrders < ActiveRecord::Migration
  def change
    create_table :accessory_orders do |t|
      t.integer :order_id, null: false
      t.integer :accessory_id, null: false

      t.timestamps
    end
  end
end
