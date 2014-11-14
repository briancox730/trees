class AddPhoneToOrder < ActiveRecord::Migration
  def up
    add_column :orders, :phone, :string
    Order.all.each do |o|
      o.update_attributes(phone: '6098979069')
    end
    change_column_null :orders, :phone, false
  end

  def down
    remove_column :orders, :phone
  end
end
