class AddSiteNameToCompany < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :site_name, :string
  end
end
