class Guest::ProductsController < ApplicationController
	def index
		@products = Product.all
        @genre =Genre.all
        @products.each do |a|
        puts a.genre.genre_name
    end
	end

	def show
		@product = Product.find(product_params)
	end

	private
    def product_params
      params.require(:product).permit(:name,:comment,:genre_id,:non_tax_proce,:sales_status)
    end
end
