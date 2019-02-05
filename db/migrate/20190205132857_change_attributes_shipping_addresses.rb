class ChangeAttributesShippingAddresses < ActiveRecord::Migration[5.2]
  def change
  	remove_column :shipping_addresses,  :address_1
  	remove_column :shipping_addresses,  :address_2 
  	remove_column :shipping_addresses,  :city     
  	remove_column :shipping_addresses,  :zipcode 
  end
end


