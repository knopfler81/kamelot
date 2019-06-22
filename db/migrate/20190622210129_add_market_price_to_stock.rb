class AddMarketPriceToStock < ActiveRecord::Migration[5.2]
  def change
  	add_column :stocks, :market_price, :decimal
  end
end
