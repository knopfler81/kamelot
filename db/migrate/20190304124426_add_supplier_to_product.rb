class AddSupplierToProduct < ActiveRecord::Migration[5.2]
  def change
  	add_column :products, :supplier_id, :integer
	  add_index  :products, :supplier_id
  end
end
