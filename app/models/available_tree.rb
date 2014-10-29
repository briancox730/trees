class AvailableTree < ActiveRecord::Base
  belongs_to :lot

  validates_presence_of :tree_id
  validates_presence_of :lot_id
end
