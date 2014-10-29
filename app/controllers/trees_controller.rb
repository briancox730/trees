class TreesController < ApplicationController
  def index
    @trees = Tree.all.includes(:type)
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
