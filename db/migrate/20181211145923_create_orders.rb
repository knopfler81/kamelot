class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.decimal :sub_total, precision: 15, scale: 2, null: false
      t.references :user, foreign_key: true
      t.string :token
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
