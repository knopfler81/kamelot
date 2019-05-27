class AddCountryToShippingAddress < ActiveRecord::Migration[5.2]
  def change
  	add_column :shipping_addresses, :country, :string
  end
end
