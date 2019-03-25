class CreateStickers < ActiveRecord::Migration[5.2]
  def change
    create_table :stickers do |t|
      t.references :product
      t.integer :quantity

      t.timestamps
    end
  end
end
