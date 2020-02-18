class DeliveryAddress < ApplicationRecord
	validates :postal_code, presence: true
	validates :postal_adress, presence: true
	validates :destination, presence: true
	belongs_to :guest
end


