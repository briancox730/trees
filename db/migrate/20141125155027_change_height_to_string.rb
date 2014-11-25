class ChangeHeightToString < ActiveRecord::Migration
  def up
    change_column :trees, :height, :string
    change_column :trees, :price, :integer
  end

  def down
    change_column :trees, :height, 'integer USING CAST(height AS integer)'
    change_column :trees, :price, :float
  end
end
