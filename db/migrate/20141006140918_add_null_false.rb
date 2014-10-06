class AddNullFalse < ActiveRecord::Migration
  def change
    change_column :orders, :tree_id, :integer, null: false
    change_column :orders, :name, :string, null: false
    change_column :orders, :email, :string, null: false
    change_column :orders, :address, :string, null: false
    change_column :orders, :city, :string, null: false
    change_column :orders, :state, :string, null: false
    change_column :orders, :zipcode, :string, null: false
    change_column :lots, :name, :string, null: false
    change_column :lots, :email, :string, null: false
  end
end
