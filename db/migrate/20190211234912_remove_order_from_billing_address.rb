class RemoveOrderFromBillingAddress < ActiveRecord::Migration[5.2]
  def change
  	remove_column :billing_addresses, :order_id
  end
end
