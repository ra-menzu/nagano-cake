class RemoveDeletedUserFromGuests < ActiveRecord::Migration[5.2]
  def change
    remove_column :guests, :deleted_user, :boolean
  end
end
