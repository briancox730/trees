class RemoveNameFromTree < ActiveRecord::Migration
  def change
    remove_column :trees, :name
    add_column :trees, :type_id, :integer
  end
end
