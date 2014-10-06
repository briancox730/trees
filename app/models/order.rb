class Order < ActiveRecord::Base
  belongs_to :tree

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
      available_trees << ["#{t.height} ft. #{t.type.name}", t.id]
    end
    available_trees
  end
end
