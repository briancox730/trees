class AddLotIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :lot_id, :integer
  end
end
