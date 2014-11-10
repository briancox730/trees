class Accessory < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true

  has_many :accessories_orders
end
