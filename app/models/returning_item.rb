class ReturningItem < ApplicationRecord
  belongs_to :returning
  belongs_to :order_item
  belongs_to :variant

  def items_count
    self.map {|s| s.quantity }.sum
  end
end
