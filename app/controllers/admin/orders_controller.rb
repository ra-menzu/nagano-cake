class Admin::OrdersController < ApplicationController
    before_action :authenticate_admin!



  def index
    @ordered_items = OrderedItem.all
    @guests = Guest.all
    @orders = Order.all

  end
  def show

     @ordered_item = OrderedItem.find(params[:id])
     @order = Order.find(params[:id])

  end
  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_orders_path
  end

  private
  def order_params
      params.require(:order).permit(:id, :order_status)
  end
end
