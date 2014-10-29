class Type < ActiveRecord::Base
  has_many :trees

  validates_presence_of :name
end
