class Order < ApplicationRecord
	has_many :ordered_items, dependent: :destroy
	has_many :products,through: :ordered_items


	belongs_to :guest
	enum payment_method: {クレジットカード:0, 銀行振込:1}
	enum order_status: {入金待ち:0,入金確認:1,製作中:2,発送準備中:3,発送済み:4}
	validates :guest_id,presence: true
	validates :postage,presence: true
	validates :postal_code,presence: true
	validates :postal_adress,presence: true
	validates :destination,presence: true
	validates :payment_method,presence: true
	validates :billing_amount,presence: true
end

