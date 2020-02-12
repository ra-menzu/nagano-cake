class AddDeletedAtToGuests < ActiveRecord::Migration[5.2]
  def change
    add_column :guests, :deleted_at, :datetime
    add_index :guests, :deleted_at
  end
end
