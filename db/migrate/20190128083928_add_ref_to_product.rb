class AddRefToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :ref, :string
  end
end
