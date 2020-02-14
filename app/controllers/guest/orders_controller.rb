class Guest::OrdersController < ApplicationController
  def new

    @order = Order.new
    @delivery_addresses = current_guest.delivery_addresses
    @a = {}
    @delivery_addresses.each do |d|


      a = d.postal_code
      b = d.postal_adress
      c = d.destination
      abc = a + b + c
      @a["#{abc}"] = d.id
    end
  end

  def index
    @orders = Order.all
  end

   def confirm
    @order = Order.new
    @delivery_addresses = current_guest.delivery_addresses
    @g = current_guest
    @gp = @g.postcode + @g.street_adress + @g.family_name + @g.last_name


    if params[:Delivery_select] == "1"
      @order_delivery = @gp

    elsif params[:Delivery_select] == "2"
      @delivery_address = DeliveryAddress.find(params[:Delivery_address].to_i)
      abc = @delivery_address.postal_code + @delivery_address.postal_code + @delivery_address.destination
      @order_delivery = abc

    elsif params[:Delivery_select] == "3"
      @pc = params[:postal_code]
      @pa = params[:postal_adress]
      @de = params[:destination]

      @order_delivery = @pc + @pa + @de

    end

    @payment = params[:order][:payment_method]
    render :confirm
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(order_params)
    @order.save
    render :confirm
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

