class CreateWindows < ActiveRecord::Migration
  def change
    create_table :windows do |t|
      t.string :delivery_window
    end
  end
end
