class CreateRestockings < ActiveRecord::Migration[5.2]
  def change
    create_table :restockings do |t|
    	t.references :product
    	t.references :sizeable, ploymorphic: true
    	t.decimal    :price, precision: 10, scale: 2
    	t.decimal    :buying_price, precision: 10, scale: 2
      t.timestamps
    end
  end
end
