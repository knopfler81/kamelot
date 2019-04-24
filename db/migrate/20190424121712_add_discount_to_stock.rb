class AddDiscountToStock < ActiveRecord::Migration[5.2]
  def change
  	add_column :stocks, :discount, :decimal, default: 0
  end
end
