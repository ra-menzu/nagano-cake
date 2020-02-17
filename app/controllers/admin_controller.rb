class AdminController < ApplicationController
	  

	def top
		@order = Order.all
	end
end
