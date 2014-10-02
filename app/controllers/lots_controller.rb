class LotsController < ApplicationController
  before_filter :authenticate_lot!

  def index
    @lots = Lot.all
  end

  def show
    @lot = Lot.find(params[:id])
    @new_zip = Zip.new
    @delivery_zipcodes = Zip.where(lot_id: @lot.id)
    @orders = Order.where(lot_id: @lot.id)
    @trees = Tree.all
    @available_trees = @lot.available_trees
    @new_tree = AvailableTree.new
  end
end
