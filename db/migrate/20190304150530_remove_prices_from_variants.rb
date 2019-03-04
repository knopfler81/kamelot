class RemovePricesFromVariants < ActiveRecord::Migration[5.2]
  def change
  	remove_column :variants, :price
  	remove_column :variants, :cost_price
  end
end
