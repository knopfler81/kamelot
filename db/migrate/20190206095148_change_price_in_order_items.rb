class ChangePriceInOrderItems < ActiveRecord::Migration[5.2]
  def change
  	remove_column :order_items, :price
  	add_monetize :order_items,  currency: { present: false }
  end
end
