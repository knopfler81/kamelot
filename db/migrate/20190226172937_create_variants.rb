class CreateVariants < ActiveRecord::Migration[5.2]
  def change
    create_table :variants do |t|
      t.string :color
      t.string :size
      t.string :cost_price
      t.string :price
      t.string :color
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
