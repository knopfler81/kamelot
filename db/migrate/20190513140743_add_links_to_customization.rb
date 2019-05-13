class AddLinksToCustomization < ActiveRecord::Migration[5.2]
  def change
  	add_column :customizations, :main_link,   :string
  	add_column :customizations, :second_link, :string
  	add_column :customizations, :third_link,  :string 
  	
  end
end
