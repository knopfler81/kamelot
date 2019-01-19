class AddNamesToBillingAddress < ActiveRecord::Migration[5.2]
  def change
    add_column :billing_addresses, :first_name, :string
    add_column :billing_addresses, :last_name, :string
  end
end
