class ChangeColumNameSaleItem < ActiveRecord::Migration[5.2]
  def change
  	rename_column :sale_items, :price, :market_price
  end
end
