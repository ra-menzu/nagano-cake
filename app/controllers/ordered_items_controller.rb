class OrderedItemsController < ApplicationController
    def update
    	@order = Order.find(params[:id])
        @ordered_item = @order.ordered_items
        @order.update(admin_order_params)
        redirect_to admin_orders_path
	end
end
