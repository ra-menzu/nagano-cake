class Guest::ProductsController < ApplicationController
	def index
		@products = Product.all
	end

	def show
		@product = Product.find(product_params)
	end

	private
    def product_params
      params.require(:product).permit(:name, :comment,:image_id,:non_tax_price)
    end
end
