class RemoveProductFromSaleItem < ActiveRecord::Migration[5.2]
  def change
  	remove_column :sale_items, :product_id
  end

end
