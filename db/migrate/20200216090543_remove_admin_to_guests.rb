class RemoveAdminToGuests < ActiveRecord::Migration[5.2]
  def change
  	remove_column :admins, :boolean 
  end
end
