class AvailableTreesController < ApplicationController
  before_filter :authenticate_lot!

  def create
    @lot = Lot.find(params[:available_tree][:lot_id])
    @available_tree = @lot.available_trees.new(available_tree_params)

    if @available_tree.save
      flash[:notice] = 'Tree now available!'
      redirect_to lot_path(@lot)
    else
      flash[:notice] = 'Save Failed!'
      redirect_to lot_path(@lot)
    end
  end

  def destroy
    @lot = Lot.find(params[:lot_id])
    @tree = params[:id]
    @available_tree = @lot.available_trees.where(tree_id: @tree)
    @available_tree.destroy_all if @available_tree
    flash[:notice] = "Tree now unavailable!"
    redirect_to lot_path(@lot)
  end

  private

  def available_tree_params
    params.require(:available_tree).permit(:tree_id, :lot_id)
  end
end
