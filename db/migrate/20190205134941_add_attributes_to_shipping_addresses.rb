class AddAttributesToShippingAddresses < ActiveRecord::Migration[5.2]
  def change
  	add_column :shipping_addresses, :address, 									 	:string 
  	add_column :shipping_addresses, :locality, 									 	:string 
  	add_column :shipping_addresses, :route,                       :string
  	add_column :shipping_addresses, :administrative_area_level_1, :string

  	add_column :shipping_addresses, :postal_code, 								:integer 
  	add_column :shipping_addresses, :street_number, 							:integer 
  end
end
