class Guest::CartItemsController < ApplicationController
    before_action :authenticate_guest!

	def index
		@cart_items = current_guest.cart_items
        @cart_item = CartItem.new
    end

    def create
     	@product = Product.find(params[:cart_item][:product_id])

        @cart_item = CartItem.new(
        	guest_id: current_guest.id,
        	product_id: params[:cart_item][:product_id],
        	quantity: params[:cart_item][:quantity])
        @cart_item.save
        redirect_to guest_cart_items_path
    end
    def show
        @cart_items = current_guest.cart_items
        @cart_item = CartItem.new
    end
    def update
        @cart_item = CartItem.find(params[:id])
        @cart_item.update(cart_item_params)
        redirect_to guest_cart_items_path
    end
    def destroy
        cart_item = CartItem.find(params[:id])
        cart_item.destroy
        redirect_to guest_cart_items_path
    end
    def destroy_all
        current_guest.cart_items.destroy_all
        redirect_to guest_cart_items_path
    end

    private
    def cart_item_params
        params.require(:cart_item).permit(:guest_id, :product_id, :quantity)
    end

end
