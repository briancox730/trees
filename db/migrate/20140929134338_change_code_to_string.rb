class ChangeCodeToString < ActiveRecord::Migration
  def change
    remove_column :zips, :code

    add_column :zips, :code, :string
  end
end
