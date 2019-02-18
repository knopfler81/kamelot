class AddSierIdToSaleItems < ActiveRecord::Migration[5.2]
  def change
  	add_reference :sale_items, :size, index: true
  end
end
