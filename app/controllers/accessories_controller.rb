class AccessoriesController < ApplicationController
  before_filter :authenticate_lot!

  def index
    @accessories = Accessory.all
    @new_accessory = Accessory.new
  end

  def create
    @accessory = Accessory.new(accessory_params)

    if @accessory.save
      redirect_to accessories_path
      flash[:notice] = 'Accessory Saved!'
    else
      redirect_to accessories_path
      flash[:notice] = 'Accessory could not be saved!'
    end
  end

  def update
    @accessory = Accessory.find(params[:id])

    respond_to do |format|
      if @accessory.update_attributes(accessory_params)
        format.json { respond_with_bip(@accessory) }
      else
        format.json { respond_with_bip(@accessory) }
      end
    end
  end

  def destroy
    @accessory = Accessory.find(params[:id])

    if @accessory.delete
      redirect_to accessories_path
      flash[:notice] = 'Accessory Removed!'
    else
      redirect_to accessories_path
      flash[:notice] = 'Accessory could not be removed!'
    end
  end

  private

  def accessory_params
    params.require(:accessory).permit(:name, :description, :price)
  end
end
