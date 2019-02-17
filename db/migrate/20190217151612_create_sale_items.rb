class CreateSaleItems < ActiveRecord::Migration[5.2]

  def change
  create_table :sale_items do |t|
    t.belongs_to :sale, null: false
    t.belongs_to :product, null: false
    t.integer :quantity, null: false
    t.decimal :price, precision: 15, scale: 2, null: false

    t.timestamps
  end

	  add_foreign_key :sale_items, :sales, name: 'fk_sale_items_to_sale'
	  add_foreign_key :sale_items, :products, name: 'fk_sale_items_to_product'
	end
end