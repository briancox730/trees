class Accessory < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true

  has_many :accessory_orders
  has_many :orders, through: :accessory_orders
end
