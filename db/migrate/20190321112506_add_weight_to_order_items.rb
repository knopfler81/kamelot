class AddWeightToOrderItems < ActiveRecord::Migration[5.2]
  def change
  	add_column :order_items, :weight, :float
  end
end
