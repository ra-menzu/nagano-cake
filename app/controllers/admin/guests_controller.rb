class Admin::GuestsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @guests = Guest.with_deleted
  end

  def show
    @guest = Guest.find(params[:id])
  end

  def edit
    @guest = Guest.find(params[:id])
  end

  def update
    @guest = Guest.find(params[:id])
    @guest.update(guest_params)
    redirect_to admin_guest_path(guest.id)
  end

private
  def guest_params
    params.require(:guest).permit(:email,:family_name,:last_name,:family_name_kana,:last_name_kana,:postcode,:street_adress,:phone_nember,:delete_user_status,:deleted_at)
  end
end
