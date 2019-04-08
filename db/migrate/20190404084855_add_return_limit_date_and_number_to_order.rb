class AddReturnLimitDateAndNumberToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :return_limit_date, :date
    add_column :orders, :number, :string
  end
end
