class AddVariantIdToSalesItem < ActiveRecord::Migration[5.2]
  def change
  	add_reference :sale_items, :variant, foreign_key: true
  	remove_column :sale_items, :size_id
  end
end
