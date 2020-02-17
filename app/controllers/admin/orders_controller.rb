class Admin::OrdersController < ApplicationController
    # before_action :authenticate_admin!
  def index
    @orders = Order.all
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
    # order_statusの更新
    order = Order.find(params[:id])
    order.update(order_params)
    redirect_to admin_order_path(order)
  end
  def production_status_update
    # production_statusの更新
    ordered_item = OrderedItem.find(params[:id])
    ordered_item.update(ordered_item_params)
    redirect_to admin_order_path(ordered_item.order_id)
  end


  private
  def order_params
      params.require(:order).permit(:order_status)
  end

  def ordered_item_params
    params.require(:ordered_item).permit(:production_status)
  end
end
