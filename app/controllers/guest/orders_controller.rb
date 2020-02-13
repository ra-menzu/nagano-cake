class Guest::OrdersController < ApplicationController
  def new
  	@guest = current_guest
    @delivery_address = DeliveryAddress.new
  end

  def index
  @guest = current_guest
  @orders = Order.all
  end
  def show
  	@order = Order.find(params[:id])
  end
  def confirm
  end
  def complete
  end
  def create
  	@order = Order.new(order_params)
  	@order.guest_id = current_guest.id
  end
end
