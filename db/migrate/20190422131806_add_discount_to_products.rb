class AddDiscountToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :discount_percentage, :integer
    add_column :products, :discounted_price, :integer
  end
end
