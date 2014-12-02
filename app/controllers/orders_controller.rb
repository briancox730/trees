class OrdersController < ApplicationController
  before_filter :authenticate_lot!, only: [:order_claim, :order_release]

  def index
    @contact = Contact.new
  end

  def show
    @order = Order.find(params[:order_id])
    @accessories = @order.accessories
    @total = @accessories.empty? ? @order.tree.price : @order.tree.price + @accessories.inject(0){ |sum, a| sum + a.price }
  end

  def new
    @zip = params[:zip]
    @available_trees, @trees = Order.available_trees(@zip)
    if @zip.nil?
      flash[:notice] = "We need a zipcode!"
      redirect_to orders_path
    elsif @available_trees.empty?
      flash[:notice] = "Sorry we dont have any trees in that area!"
      redirect_to orders_path
    end
    @geo = Geokit::Geocoders::MultiGeocoder.geocode(@zip)
    if @geo.success
      @state = @geo.state
      @city = @geo.city
    end
    @order = Order.new
    @windows = Window.all
    @accessories = Accessory.all
    @contact = Contact.new
  end

  def confirm
    @order = Order.new(order_params)

    unless @order.valid?
      flash[:now] = "Order could not be processed!"
      @zip = @order.zipcode
      @state = @order.state
      @city = @order.city
      @available_trees, @trees = Order.available_trees(@zip)
      @windows = Window.all
      @accessories = Accessory.all
      params[:accessory_orders] = params[:order][:accessory_orders]
      render action: :new
    end
    @accessories = Accessory.where(id: params[:order][:accessory_orders])
    @total = @accessories.empty? ? @order.tree.price : @order.tree.price + @accessories.inject(0){ |sum, a| sum + a.price }
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      Order.build_accessories(@order, params[:accessory_orders])
      redirect_to order_confirmation_orders_path(id: @order.id)
    else
      flash[:now] = "Order could not be processed!"
      redirect_to orders_path
    end
  end

  def order_confirmation
    @order = Order.find(params[:id])
    @accessories = @order.accessories
    @total = @accessories.empty? ? @order.tree.price : @order.tree.price + @accessories.inject(0){ |sum, a| sum + a.price }
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
    params.require(:order).permit(:tree_id, :name, :email, :address, :city, :state,
                                  :zipcode, :lot_id, :window_id,
                                  :instructions, :phone, :order, :accessory_orders)
  end
end
