class AddReturnAskedToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :return_asked, :boolean, default: false
  end
end
