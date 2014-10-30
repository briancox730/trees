class OrdersController < ApplicationController
  before_filter :authenticate_lot!, only: [:order_claim, :order_release]

  def new
    @zip = params[:zip]
    @geo = Geokit::Geocoders::MultiGeocoder.geocode(@zip)
    if @geo.success
      @state = @geo.state
      @city = @geo.city
    end
    @available_trees = Order.available_trees(@zip)
    @order = Order.new
    @windows = Window.all
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to order_confirmation_orders_path(id: @order.id)
    else
      flash[:now] = "Order could not be processed!"
      render :new
    end
  end

  def order_confirmation
    @order = Order.find(params[:id])
  end

  def order_claim
    @order = Order.find(params[:order_id])
    @order.lot_id = current_lot.id

    if @order.save
      flash[:notice] = "Order Claimed!"
      redirect_to open_orders_lots_path
    else
      flash[:notice] = "Order Claim Failed!"
      redirect_to open_orders_lots_path
    end
  end

  def order_release
    @order = Order.find(params[:order_id])
    @order.lot_id = nil

    if @order.save
      flash[:notice] = "Order Released!"
      redirect_to lot_path(current_lot.id)
    else
      flash[:notice] = "Order Release Failed!"
      redirect_to lot_path(current_lot.id)
    end
  end

  def order_delivered
    @order = Order.find(params[:order_id])
    @order.delivered = true

    if @order.save
      flash[:notice] = "Order Delivered!"
      redirect_to lot_path(current_lot.id)
    else
      flash[:notice] = "Order Delivered Failed!"
      redirect_to lot_path(current_lot.id)
    end
  end

  def zipcode_search
    @zip = params[:zipcode_search][:zipcode]

    @count = 0

    @zips = Zip.where(code: @zip).includes(:lot)

    @zips.each do |zip|
      @count += zip.lot.available_trees.count
    end

    if @zips.size > 0 && @count > 0
      redirect_to new_order_path(zip: @zip)
    else
      flash[:notice] = "Sorry we dont have any trees in that area!"
      redirect_to orders_path
    end
  end

  private

  def order_params
    params.require(:order).permit(:tree_id, :name, :email, :address, :city, :state, :zipcode, :lot_id, :window_id)
  end
end
