class AddInitialStockToStock < ActiveRecord::Migration[5.2]
  def change
  	add_column :stocks, :initial_quantity, :integer
  end
end
