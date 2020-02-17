class HomesController < ApplicationController
<<<<<<< HEAD

=======
>>>>>>> 5939bdf7f89629617f93ba27897c3f02089cd543

  def top
	@products = Product.all
  end

  def about
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
