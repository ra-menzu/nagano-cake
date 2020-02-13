class Order < ApplicationRecord
	has_many :ordered_itemd, dependent: :destroy
	belongs_to :guest
	enum payment_method: {クレジットカード:0, 銀行振込:1}
end
