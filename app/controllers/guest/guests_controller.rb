class GuestsController < ApplicationController
	before_action :authenticate_guest!

	def show
		@guest = Guest.find(params[:id])
	end

	def edit
		@guest = Guest.find(params[:id])
	end

	private
	def guest_params
		params.require(:guest).permit(:family_name,:last_name,:family_name_kana,:last_name_kana,:postcode,:street_adress,:phone_nember,:email)
	end
end