class AddWindowToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :window_id, :integer
  end
end
