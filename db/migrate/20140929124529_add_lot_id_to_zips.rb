class AddLotIdToZips < ActiveRecord::Migration
  def change
    add_column :zips, :lot_id, :integer
  end
end
