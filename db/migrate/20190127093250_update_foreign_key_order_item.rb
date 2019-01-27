class UpdateForeignKeyOrderItem < ActiveRecord::Migration[5.2]
  def change
    # remove the old foreign_key
    remove_foreign_key :order_items, :orders
    remove_foreign_key :order_items, :sizes

    # add the new foreign_key
    add_foreign_key :order_items, :orders, on_delete: :cascade
    add_foreign_key :order_items, :sizes, on_delete: :cascade

  end
end
