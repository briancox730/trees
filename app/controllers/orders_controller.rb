class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def zipcode_search
    @zip = params[:zipcode_search][:query]

    @lots = Zip.where(code: @zip)
    if @lots.size > 0
      redirect_to new_order_path
    else
      redirect_to orders_path
    end
  end
end
