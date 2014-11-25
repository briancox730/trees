class AddReadToContacts < ActiveRecord::Migration
  def up
    add_column :contacts, :read, :boolean, default: false
  end

  def down
    remove_column :contacts, :read
  end
end
