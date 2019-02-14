class RemoveProductIdFromOrderItem < ActiveRecord::Migration[5.2]
  def change
  	remove_column :order_items, :product_id
  end
end
