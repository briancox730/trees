class CreateZips < ActiveRecord::Migration
  def change
    create_table :zips do |t|
      t.integer :code
    end
    add_index :zips, :code, unique: true
  end
end
