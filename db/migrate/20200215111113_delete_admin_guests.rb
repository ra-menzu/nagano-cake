class DeleteAdminGuests < ActiveRecord::Migration[5.2]
  def change
  	drop_table :admin_guests
  end
end
