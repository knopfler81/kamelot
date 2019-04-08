class CreateReturnings < ActiveRecord::Migration[5.2]
  def change
    create_table :returnings do |t|
      t.string :number
      t.date :limit_date
      t.integer :status
      t.references :order
      t.text :reason
      t.references :user

      t.timestamps
    end
  end
end
