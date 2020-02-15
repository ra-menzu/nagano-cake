class Admin::OrdersController < ApplicationController
  def index
    @ordered_items = OrderedItem.all
    @guests = Guest.all
    @orders = Order.all
  end
  def show
     @ordered_items = OrderedItem.all
     @guest = Guest.find(params[:id])
     @order = Order.all
     @product = Product.all
  end

  def update
    @order = Order.find(params[:id])
    @Order.update(Order_params)
    redirect_to admin_orders_path
  end

  private
  def order_params
      params.require(:order).permit(:id, :order_status)
  end
end
