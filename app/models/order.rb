class Order < ApplicationRecord
	has_many :ordered_item
	enum payment_method: {クレジットカード:0, 銀行振込:1}
end
