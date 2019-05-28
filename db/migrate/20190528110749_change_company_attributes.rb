class ChangeCompanyAttributes < ActiveRecord::Migration[5.2]
  def change
  	rename_column :companies, :name, :admin_name
  end
end
