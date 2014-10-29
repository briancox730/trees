class Zip < ActiveRecord::Base
  belongs_to :lot

  validates_presence_of :code
  validates_presence_of :lot_id
end
