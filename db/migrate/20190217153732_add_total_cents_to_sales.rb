class AddTotalCentsToSales < ActiveRecord::Migration[5.2]
  def change
  	add_monetize :sales, :total, currency: { present: false }
  end
end
