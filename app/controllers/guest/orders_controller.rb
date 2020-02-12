class Guest::OrdersController < ApplicationController
	def show
		@cart_items = Cart_item.all
	end

	def update
		@cart_item.update(quentity: params[:quentity].to_i)
        redirect_to current_cart
	end

	def destroy
		@cart_item.destroy
		redirect_to current_cart
	end

	def destroy_all
	end

	def create
	end


	private
	def cart_item_params
		params.require(:cart_item).permit(:guest_id, :product_id, :quentity)

	end
end
