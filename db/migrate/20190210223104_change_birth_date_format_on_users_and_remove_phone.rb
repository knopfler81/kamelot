class ChangeBirthDateFormatOnUsersAndRemovePhone < ActiveRecord::Migration[5.2]
  def change
  	change_column :users, :birth_date, :string 
  	remove_column :users, :phone
  end
end
