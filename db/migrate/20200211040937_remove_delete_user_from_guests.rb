class RemoveDeleteUserFromGuests < ActiveRecord::Migration[5.2]
  def change
    remove_column :guests, :delete_user, :boolean
  end
end
