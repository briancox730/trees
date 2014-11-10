class TreesController < ApplicationController
  before_action :authenticate_lot!

  def index
    @trees = Tree.all.includes(:type)
    @types = Type.all
    @new_tree = Tree.new
  end

  def edit

  end

  def create
    @tree = Tree.new(tree_params)

    if @tree.save
      redirect_to trees_path
    else
      flash[:notice] = "Tree could not be added"
      redirect_to trees_path
    end
  end

  def update
    @tree = Tree.find(params[:id])

    respond_to do |format|
      if @tree.update_attributes(tree_params)
        format.json { respond_with_bip(@tree) }
      else
        format.json { respond_with_bip(@tree) }
      end
    end
  end

  def destroy
    @tree = Tree.find(params[:id])
    if @tree.destroy
      flash[:notice] = "Tree removed!"
      redirect_to trees_path
    else
      flash[:notice] = "Tree could not be removed"
      redirect_to trees_path
    end
  end

  private

  def tree_params
    params.require(:tree).permit(:type_id, :height, :price)
  end
end
