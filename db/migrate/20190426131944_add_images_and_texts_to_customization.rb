class AddImagesAndTextsToCustomization < ActiveRecord::Migration[5.2]
  def change
		add_column :customizations, :text_main_image,       :string
	  add_column :customizations, :text_btn_main_image,   :string
  	add_column :customizations, :second_image,          :string
  	add_column :customizations, :third_image,           :string
  	add_column :customizations, :text_second_image,     :string
    add_column :customizations, :text_btn_second_image, :string
  	add_column :customizations, :text_third_image,      :string
    add_column :customizations, :text_btn_third_image,  :string
  end
end
