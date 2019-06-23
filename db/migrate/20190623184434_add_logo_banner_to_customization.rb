class AddLogoBannerToCustomization < ActiveRecord::Migration[5.2]
  def change
  	add_column :customizations, :logo_banner, :string
  end
end
