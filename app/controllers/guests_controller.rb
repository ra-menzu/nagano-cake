class GuestsController < ApplicationController
	def show
		@guest = Guest.find(params[:id])
	end

	def edit
		@guest = Guest.find(params[:id])
	end

	def update
		guest = Guest.find(params[:id])
		guest.update(guest_params)
		redirect_to guest_path(guest)
	end

	def index
		guest = current_guest.id

	end

	def destroy
		guest = Guest.find(params[:id])
		guest.destroy
		redirect_to root_path
	end

	private
	def guest_params
		params.require(:guest).permit(:family_name,:last_name,:family_name_kana,:last_name_kana,:postcode,:street_adress,:phone_nember,:email,:deleted_at)
	end
end