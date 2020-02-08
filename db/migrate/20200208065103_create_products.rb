class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :genre_id
      t.string :name
      t.text :comment
      t.string :image_id
      t.integer :non_tax_price
      t.integer :sales_status
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
