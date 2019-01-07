class RemoveSubTotalFromOrder < ActiveRecord::Migration[5.2]
  def change
  	remove_column :orders, :sub_total
  end
end
