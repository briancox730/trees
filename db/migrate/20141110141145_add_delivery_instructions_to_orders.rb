class AddDeliveryInstructionsToOrders < ActiveRecord::Migration
  def up
    add_column :orders, :instructions, :string
  end

  def down
    remove_column :orders, :instructions
  end
end
