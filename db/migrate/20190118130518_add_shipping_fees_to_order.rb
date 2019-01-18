class AddShippingFeesToOrder < ActiveRecord::Migration[5.2]
  def change
    add_monetize :orders, :shipping_fees, currency: { present: false }
  end
end
