class Order < ApplicationRecord
  belongs_to :user
  has_many :items, class_name: "OrderItem"

  enum status: [:pending, :paid, :sent, :cancelled]
end
