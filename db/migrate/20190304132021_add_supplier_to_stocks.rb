class AddSupplierToStocks < ActiveRecord::Migration[5.2]
  def change
  	add_reference :stocks, :supplier, foreign_key: true
  	add_column    :stocks, :cost_price, :decimal
  	add_column    :stocks, :price, :decimal
  end
end
