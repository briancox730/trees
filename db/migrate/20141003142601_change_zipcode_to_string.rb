class ChangeZipcodeToString < ActiveRecord::Migration
  def change
    remove_column :orders, :zipcode
    add_column :orders, :zipcode, :string
  end
end
