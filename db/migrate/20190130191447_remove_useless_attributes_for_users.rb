class RemoveUselessAttributesForUsers < ActiveRecord::Migration[5.2]
  def change
  	remove_column :users, :address_2
  	remove_column :users, :address_1
  	remove_column :users, :city
  	remove_column :users, :country
  	remove_column :users, :zipcode
  end
end
