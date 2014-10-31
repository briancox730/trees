class Order < ActiveRecord::Base
  belongs_to :tree
  belongs_to :window

  validates_presence_of :tree_id
  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :address
  validates_presence_of :city
  validates_presence_of :zipcode
  validates_presence_of :state
  validates_presence_of :window_id

  def self.available_trees(zip)
    lot_ids = Zip.where(code: zip).map(&:lot_id)
    lots = Lot.where(id: lot_ids)
    trees_ids = []
    lots.each do |lot|
      lot.available_trees.each do |tree|
        trees_ids << tree.tree_id
      end
    end
    trees_ids.uniq!
    trees = Tree.where(id: trees_ids)
    available_trees = []
    trees.each do |t|
      available_trees << ["#{t.height} ft. #{t.type.name} - $#{t.price}", t.id]
    end
    return available_trees, trees
  end
end
