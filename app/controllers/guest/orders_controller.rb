class Guest::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = current_guest.delivery_addresses
    @a = []
    @delivery_addresses.each do |d|

      b = d.postal_code
      c = d.postal_adress
      d = d.destination
      @a << [b + c + e]
    end
  end
  def index
    @orders = Order.all
  end
  def show
    @order = Order.find(params[:id])
  end
  def confirm
    @order = Order.find(params[:id])
  end
  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to guest_orders_path
  end
  def complete
  end
  def order_params
    params.require(:order).permit(:guest_id,:postcode,:postal_code,:order_id,:postal_adress,:destination,:payment_method )
  end
  def delivery_address_params
    params.require(:delivery_address).permit(:postal_code, :postal_adress,:destination)
  end
end

