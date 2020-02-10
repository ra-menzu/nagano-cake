class Admin::ProductsController < ApplicationController
  def index
  	@products = Product.all
  end
  def new
    @product = Product.new
  end
  def create
  	@product = Product.new(product_params)
  	@product.save

  end
  def show
    @product = Product.find(params[:id])
  end
  def edit
    @product = Product.find(params[:id])
  end
  def update
    @product = Product.find(params)

  end

  private
  def product_params
    params.require(:product).permit(:name,:comment,:genre_id,:non_tax_proce,:sales_status)
  end
end
