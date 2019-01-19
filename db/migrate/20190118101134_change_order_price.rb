class ChangeOrderPrice < ActiveRecord::Migration[5.2]
  def change
  	remove_column :orders, :sub_total
  	add_monetize :orders, :sub_total, currency: { present: false }
  end
end
