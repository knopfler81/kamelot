class AddTotalWeightToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :total_weight, :float
  end
end
