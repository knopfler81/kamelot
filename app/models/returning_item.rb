class ReturningItem < ApplicationRecord
  belongs_to :returning
  belongs_to :order_item
  belongs_to :variant

  after_save :set_order_item_selected

  def items_count
    self.map {|s| s.quantity }.sum
  end

  def set_order_item_selected
  	self.order_item.selected = true if self.selected?
  	self.order_item.save!
  end
end
