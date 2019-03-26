class AddQrCodeToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :qr_code, :string
  end
end
