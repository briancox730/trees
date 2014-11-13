class AccessoryOrder < ActiveRecord::Base
  validates :order_id, presence: true
  validates :accessory_id, presence: true

  belongs_to :order
  belongs_to :accessory
end
