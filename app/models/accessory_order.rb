class AccessoryOrder < ActiveRecord::Base
  validates :order_id, presence: true
  validates :accessory_id, presence: true

  belongs_to :orders
  belongs_to :accessories
end
