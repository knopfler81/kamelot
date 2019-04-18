class AddMissingToOrderItems < ActiveRecord::Migration[5.2]
  def change
    add_column :order_items, :missing_quantity, :integer, default: 0
  end
end
