class AddNamesInShippingAddresses < ActiveRecord::Migration[5.2]
  def change
  	add_column :shipping_addresses, :first_name, :string
  	add_column :shipping_addresses, :last_name, :string
  	rename_column :shipping_addresses, :zip_code, :zipcode
  end
end
