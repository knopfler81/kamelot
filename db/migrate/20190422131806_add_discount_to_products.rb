class AddDiscountToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :discount_percentage, :integer, default: 0
    add_column :products, :discounted_price, :decimal, default: 0
  end
end
