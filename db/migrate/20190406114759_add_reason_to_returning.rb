class AddReasonToReturning < ActiveRecord::Migration[5.2]
  def change
    add_column :returnings, :reason, :text
  end
end
