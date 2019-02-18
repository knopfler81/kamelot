class AddStatusToSales < ActiveRecord::Migration[5.2]
  def change
  	add_column :sales, :status, :integer
  end
end
