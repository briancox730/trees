class Tree < ActiveRecord::Base
  belongs_to :type

  validates_presence_of :type_id
  validates_presence_of :height
  validates_presence_of :price
end
