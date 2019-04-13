class AddSelectedToOrderItem < ActiveRecord::Migration[5.2]
  def change
    add_column :order_items, :selected, :boolean, default: false
  end
end
