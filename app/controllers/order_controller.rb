class OrdersController < ApplicationConroller
  def new
    @order = Order.new
  end
end
