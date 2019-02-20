class AddDefaultToCustomization < ActiveRecord::Migration[5.2]
  	def change
  		change_column :customizations, :navbar_color,               :string, default: "#FFFFFF"
  		change_column :customizations, :body_color,                 :string, default: "#FFFFFF"
  	  change_column :customizations, :nav_links_color,            :string, default: "#AAAAAA"
  	  change_column :customizations, :btn_main_color,             :string, default: "#111"
  	  change_column :customizations, :btn_secondary_color,        :string, default: "#FFFF"
  	  change_column :customizations, :text_color,                 :string, default: "#111"
  	  change_column :customizations, :main_btn_text_color,        :string, default: "#FFF"
  	  change_column :customizations, :secondary_btn_text_color,   :string, default: "#111"
			change_column :customizations,  :main_image,                :string, default: 'https://s3.eu-west-3.amazonaws.com/shopsuper/landing.jpg'
  end
end