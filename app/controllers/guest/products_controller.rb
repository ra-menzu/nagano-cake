class Guest::ProductsController < ApplicationController
	def index
		@products = Product.all
		@genres = Genre.all
	end

	def show
		@product = Product.find(params[:id])
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
