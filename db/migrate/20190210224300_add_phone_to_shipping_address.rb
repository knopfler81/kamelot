class AddPhoneToShippingAddress < ActiveRecord::Migration[5.2]
  def change
  	add_column :shipping_addresses, :phone, :string
  end
end
