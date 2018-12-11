class Order < ApplicationRecord
  belongs_to :user
  has_many :items, class_name: "OrderItems"
end
