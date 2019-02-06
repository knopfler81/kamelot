class ManageMonetizeInOrders < ActiveRecord::Migration[5.2]
  def change
  	remove_column :orders, :sub_total_cents
  	remove_column :orders, :shipping_fees_cents

  	add_column :orders, :sub_total, :decimal
  	add_column :orders, :shipping_fees, :decimal
  end
end
