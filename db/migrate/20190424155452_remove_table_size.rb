class RemoveTableSize < ActiveRecord::Migration[5.2]
  def change
  	drop_table :sizes
  end
end
