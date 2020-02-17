class Guest::ProductsController < ApplicationController

	def index
		@genres = Genre.where(class_status: '0')
		if  params[:genre_id]
			@genre = Genre.find(params[:genre_id])
			@products = @genre.products.all
		else
			@products = Product.where(sales_status: '0')
		end
	end

	def show
		@product = Product.find(params[:id])
		@cart_item = CartItem.new
	end

	private
    def product_params
      params.require(:product).permit(:name,:comment,:genre_id,:non_tax_price,:sales_status,:image )
    end
  private
  def genre_params
      params.require(:genre).permit(:id, :class_status, :name)
  end
end
