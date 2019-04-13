class Users < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :list_subscriber, :boolean, default: false
  end
end
