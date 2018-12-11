class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :title, null: false, limit: 100

      t.timestamps
    end
  end
end
