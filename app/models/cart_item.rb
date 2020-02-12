class CartItem < ApplicationRecord
	belongs_to :guest
	belongs_to :product
end
