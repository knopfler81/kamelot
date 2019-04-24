class AddDiscountToStock < ActiveRecord::Migration[5.2]
  def change
  	add_column :stocks, :discount, :integer, default: 0
  end
end
