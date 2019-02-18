class AddQuantityStockToSizes < ActiveRecord::Migration[5.2]
  def change
  	add_column :sizes, :quantity_stock, :integer
  end
end
