class Product < ApplicationRecord
	has_many :cart_items, dependent: :destroy
	enum sales_status:{販売中: 0, 売切れ:1}
	belongs_to :genre
end
