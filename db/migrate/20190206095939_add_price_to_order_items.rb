class AddPriceToOrderItems < ActiveRecord::Migration[5.2]
  def change
  	add_column :order_items, :price, :decimal
  	add_reference :order_items, :size, foreign_key: true
  end
end
