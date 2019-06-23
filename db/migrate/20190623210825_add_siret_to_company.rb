class AddSiretToCompany < ActiveRecord::Migration[5.2]
  def change
  	add_column :companies, :siret, :string
  end
end
