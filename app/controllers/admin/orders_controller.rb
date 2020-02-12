class Admin::OrdersController < ApplicationController
  def new
  	@guest = current_guest
  end
  def index
  	@guest = Guest.find(params[:id])
  	@orders = @guest.orders
  end
  def show
  	@order = Order.find(params[:id])
  end
  def confirm
  	@order = Order.find(params[:id])
  end
  def complete
  end
end
