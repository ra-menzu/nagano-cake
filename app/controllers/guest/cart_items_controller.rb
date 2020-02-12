class Guest::CartItemsController < ApplicationController
	def index
		@guest = current_guest
		@product_item = @guest.cart_items
    end
    def create
		@cart_item = current_guest.cart_items.new(cart_item_params)
		if @cart_item.save
		   redirect_to public_cart_items_path(@product)
		else render :index
	end

end
