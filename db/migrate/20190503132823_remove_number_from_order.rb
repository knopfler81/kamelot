class RemoveNumberFromOrder < ActiveRecord::Migration[5.2]
  def change
  	remove_column :orders, :number
  end
end
