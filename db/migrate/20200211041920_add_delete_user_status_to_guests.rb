class AddDeleteUserStatusToGuests < ActiveRecord::Migration[5.2]
  def change
    add_column :guests, :delete_user_status, :boolean,default: false, null: false
  end
end
