class Admin::OrdersController < ApplicationController
    # before_action :authenticate_admin!



  def index
    if params[:day]
       @orders = Order.created_at
    elsif params[:id]
       @orders = Order.where(guest_id: params[:id].to_i)
    else
      @orders = Order.all
    end






    # @ordered_item = Order.find(params[:id])
    # @sum = 0
    # @total_quantity = []
    # 一つの注文の合計を出す <= 10
    # 配列に値を入れる total_quantity = [10]
    # 2つめの注文の合計を出す <= 3
    # 配列に値を入れる total_quantity = [10,3]

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