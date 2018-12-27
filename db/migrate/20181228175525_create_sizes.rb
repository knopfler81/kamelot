class CreateSizes < ActiveRecord::Migration[5.2]
  def change
    create_table :sizes do |t|
      t.string :size_name
      t.integer :quantity
      t.belongs_to :product, foreign_key: true

      t.timestamps
    end
  end
end
