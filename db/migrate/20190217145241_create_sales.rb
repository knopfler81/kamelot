class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|  
	    t.decimal :sub_total
	    t.references :user, foreign_key: true
	    t.string :token
      t.timestamps
    end
  end
end
