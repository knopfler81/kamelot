class AddTexteToCustomization < ActiveRecord::Migration[5.2]
  def change
  	add_column :customizations, :delivery,                   :text
  	add_column :customizations, :secure_payment,             :text
  	add_column :customizations, :general_condition_of_sales, :text
  	add_column :customizations, :legal_notice,               :text
  	add_column :customizations, :confidentiality_policy,     :text
  	add_column :customizations, :cookies_policy,             :text
  	add_column :customizations, :navbar_color,               :string
  	add_column :customizations, :body_color,                 :string
    add_column :customizations, :nav_links_color,            :string
    add_column :customizations, :btn_main_color,             :string
    add_column :customizations, :btn_secondary_color,        :string
    add_column :customizations, :text_color,                 :string
    add_column :customizations, :main_btn_text_color,        :string
    add_column :customizations, :secondary_btn_text_color,   :string
  end
end