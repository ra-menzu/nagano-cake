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
    @del = DeliveryAddress.new
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

      @del.postal_code = @pc
      @del.postal_adress = @pa
      @del.destination = @de
      @del.guest_id = current_guest.id

      @del.save!

    elsif render :new


    end

    @payment = params[:order][:payment_method]
    @cart_items = current_guest.cart_items
    @cart_item = CartItem.new
    @postage = 800
    @ordered_item = OrderedItem.new
    render :confirm
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(order_params)
    @order.guest_id = current_guest.id

    if @order.save!

      current_guest.cart_items.each do |item|

      @ordered_item = OrderedItem.new
      @ordered_item.order_id = @order.id
      @ordered_item.tax_included_price = item.product.non_tax_price * 1.1
      @ordered_item.product_id = item.product_id
      @ordered_item.quantity = item.quantity
      @ordered_item.save!

    end

      current_guest.cart_items.destroy_all
      redirect_to guest_orders_complete_path
    else
      render :confirm
    end
  end

  def complete
  end

  private
    def order_params
      params.require(:order).permit(:guest_id,:postcode,:postal_code,:order_id,:postal_adress,:destination,:payment_method )
    end
    def ordered_item_params
      params.require(:ordered_item).permit(:order_id,:product_id,:quantity,:tax_included_price,:production_status )
    end
    def delivery_address_params
      params.require(:delivery_address).permit(:postal_code, :postal_adress,:destination)
    end
end

