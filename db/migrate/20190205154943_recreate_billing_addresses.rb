class RecreateBillingAddresses < ActiveRecord::Migration[5.2]
  def change
  		add_column :billing_addresses, :address, 									 	:string 
  		add_column :billing_addresses, :locality, 									 	:string 
  		add_column :billing_addresses, :route,                       :string
  		add_column :billing_addresses, :administrative_area_level_1, :string
  		add_column :billing_addresses, :postal_code, 								:integer 
  		add_column :billing_addresses, :street_number, 							:integer 

  		remove_column :billing_addresses, :address_1
  		remove_column :billing_addresses, :address_2
  		remove_column :billing_addresses, :zipcode
  		remove_column :billing_addresses, :city
  end
end
