class AddMoreAttributesToUser < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :gender, :boolean, default: true
  	add_column :users, :birth_date, :datetime
  	add_column :users, :country, :string
  end
end
