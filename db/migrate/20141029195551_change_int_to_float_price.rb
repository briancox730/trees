class ChangeIntToFloatPrice < ActiveRecord::Migration
  def up
    change_column :trees, :price, :float
  end

  def down
    change_column :trees, :price, :integer
  end
end
