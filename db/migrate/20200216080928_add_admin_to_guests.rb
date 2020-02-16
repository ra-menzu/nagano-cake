class AddAdminToGuests < ActiveRecord::Migration[5.2]
  def change
    add_column :guests, :admin, :boolean, default: false
  end
end
