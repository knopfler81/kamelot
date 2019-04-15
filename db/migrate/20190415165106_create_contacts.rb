class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :full_name
      t.string :email
      t.string :message_content

      t.timestamps
    end
  end
end
