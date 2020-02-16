class Guest::DeliveryAddressesController < ApplicationController
		before_action :authenticate_guest!

	def index
		@delivery_address = DeliveryAddress.new
		@delivery_addresses = DeliveryAddress.all
	end

	def create
		@delivery_address = DeliveryAddress.new(delivery_address_params)
		@delivery_address.guest_id = current_guest.id
		@delivery_address.save
		redirect_to guest_delivery_addresses_path
	end

	def edit
		@delivery_address = DeliveryAddress.find(params[:id])
	end

	def update
		delivery_address = DeliveryAddress.find(params[:id])
		delivery_address.update(delivery_address_params)
		redirect_to guest_delivery_addresses_path
	end

	def destroy
		@delivery_address = DeliveryAddress.find(params[:id])
		@delivery_address.destroy
		redirect_to guest_delivery_addresses_path
	end


	private
    def delivery_address_params
      params.require(:delivery_address).permit(:postal_code, :postal_adress,:destination)
    end
end
