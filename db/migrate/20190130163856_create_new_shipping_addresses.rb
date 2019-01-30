class CreateNewShippingAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_addresses do |t|
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :zip_code
      t.belongs_to :user

      t.timestamps
    end
  end
end
