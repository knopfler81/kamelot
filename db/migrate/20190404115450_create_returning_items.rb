class CreateReturningItems < ActiveRecord::Migration[5.2]
  def change
    create_table :returning_items do |t|
      t.references :returning, foreign_key: true
      t.string :state
      t.boolean :selected, default: false
      t.references :order_item


      t.timestamps
    end
  end
end
