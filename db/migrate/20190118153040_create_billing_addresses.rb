class CreateBillingAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :billing_addresses do |t|
      t.string :address_1
      t.string :address_2
      t.string :zipcode
      t.string :city
      t.string :phone
      t.string :title
      t.belongs_to :user
      t.belongs_to :order

      t.timestamps
    end
  end
end
