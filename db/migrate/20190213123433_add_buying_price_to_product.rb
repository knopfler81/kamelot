class AddBuyingPriceToProduct < ActiveRecord::Migration[5.2]
  def change
  	add_column :products, :buying_price, :decimal, precision: 10, scale: 2
  end
end
