class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :address_1
      t.string :address_2
      t.string :zipcode
      t.string :city
      t.string :country
      t.string :phone
      t.boolean :subject_vat, default: false


      t.timestamps
    end
  end
end
