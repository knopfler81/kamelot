class ReturningItem < ApplicationRecord
  belongs_to :returning
  belongs_to :order_item
end
