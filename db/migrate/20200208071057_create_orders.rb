class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :guest_id
      t.integer :postage
      t.string :postal_code
      t.string :postal_adress
      t.text :destination
      t.integer :payment_method
      t.integer :billing_amount
      t.integer :order_status
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
