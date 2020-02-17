class ChangeDateOrderStatusToOrders < ActiveRecord::Migration[5.2]
  def change
  	change_column :orders, :order_status, :integer, default: 0, limit: 1
  end
end
