class CreateSuppliers < ActiveRecord::Migration[5.2]
  def change
    create_table :suppliers do |t|
    	t.string :company
    	t.string :address
    	t.string :zipcode
    	t.string :country
      t.string :city
    	t.string :phone_number
    	t.string :email

      t.timestamps
    end
  end
end
