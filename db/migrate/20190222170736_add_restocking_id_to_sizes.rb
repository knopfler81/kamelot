class AddRestockingIdToSizes < ActiveRecord::Migration[5.2]
  def changee

  	add_references :sizes, :restoking, index: true
  end
end
