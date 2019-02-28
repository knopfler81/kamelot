class AddVariantIdOrderItems < ActiveRecord::Migration[5.2]
  def change
  	add_reference :order_items, :variant, foreign_key: true
  	remove_column :order_items, :size_id
  end
end
