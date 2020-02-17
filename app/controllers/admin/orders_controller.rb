class Admin::OrdersController < ApplicationController
    # before_action :authenticate_admin!



  def index
    if params[:day]
       @orders = Order.where(created_at: Time.zone.now.all_day)
    elsif params[:id]
        @orders = Order.where(guest_id: params[:id])
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
     @order = Order.find(params[:id])
     @ordered_item = @order.ordered_items
  end
  def update
    @order = Order.find(params[:id])
    @ordered_item = @order.ordered_items
 
    redirect_to admin_order_path(@order)
  end

  private
  def order_params
      params.require(:order).permit(:id, :order_status)
  end
  def order_item_params
      params.require(:order_item).permit(:order_id, :product_id, :tax_included_price, :production_status, :quantity, :created_at)
  end
end