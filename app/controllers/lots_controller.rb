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
    @trees = Tree.where(lot_id: @lot.id)
    @new_tree = Tree.new
  end
end
