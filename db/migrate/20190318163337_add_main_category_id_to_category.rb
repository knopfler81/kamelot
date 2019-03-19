class AddMainCategoryIdToCategory < ActiveRecord::Migration[5.2]
  def change
  	add_reference :categories, :main_category
  end
end
