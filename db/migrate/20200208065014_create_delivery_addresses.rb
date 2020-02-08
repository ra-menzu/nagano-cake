class CreateDeliveryAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_addresses do |t|
      t.integer :guest_id
      t.string :postal_code
      t.string :postal_adress
      t.string :destination
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
