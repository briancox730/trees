class ZipsController < ApplicationController
  before_filter :authenticate_lot!

  def create
    @zip = Zip.new(zip_params)
    if @zip.save
      flash[:notice] = 'Zip added!'
      redirect_to lot_path(id: params[:zip][:lot_id])
    else
      flash[:notice] = 'Zip did not save!'
      redirect_to lot_path(id: params[:zip][:lot_id])
    end
  end

  def destroy
    @zip = Zip.find(params[:id])
    @zip.destroy
    redirect_to lot_path(id: @zip.lot_id)
  end

  private

  def zip_params
    params.require(:zip).permit(:code, :lot_id)
  end
end
