class RemovePriceProducts < ActiveRecord::Migration[5.2]
  def change
  	remove_column :products, :price_cents
  	add_column :products, :price, :decimal
  end
end
