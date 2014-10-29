class Lot < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, uniqueness: true
  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :first_name
  validates_presence_of :last_name

  has_many :available_trees
  has_many :zips
end
