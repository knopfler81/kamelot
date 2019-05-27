class AddCountryToBillingAddress < ActiveRecord::Migration[5.2]
  def change
    add_column :billing_addresses, :country, :string
  end
end
