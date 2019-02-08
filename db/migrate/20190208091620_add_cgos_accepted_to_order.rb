class AddCgosAcceptedToOrder < ActiveRecord::Migration[5.2]
  def change
  	add_column :orders, :gcos_accepted, :boolean, default: false
  end
end
