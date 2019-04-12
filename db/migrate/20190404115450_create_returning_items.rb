class CreateReturningItems < ActiveRecord::Migration[5.2]
  def change
    create_table :returning_items do |t|
      t.references :returning, foreign_key: true
      t.references :variant
      t.references :order_item
      t.string :state
      t.boolean :selected, default: false
      t.decimal :price
      t.integer :quantity

      t.timestamps
    end
  end
end
