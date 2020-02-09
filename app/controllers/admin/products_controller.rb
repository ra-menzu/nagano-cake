class Admin::ProductsController < ApplicationController
  def index
  	@products = Product.all
  end
  def new
  	@product = Product.new
  end
  def create
  	@product = Product.new(product_params)
  	if @product.save
  		redirect_to product_path(product.id)
  	else
  		render :index
  	end
  end
end
