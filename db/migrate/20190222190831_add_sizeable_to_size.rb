class AddSizeableToSize < ActiveRecord::Migration[5.2]
  def change
  	add_reference :sizes, :sizeable, polymorphic: true, index: true
  end
end
