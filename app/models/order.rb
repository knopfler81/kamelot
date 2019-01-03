class Order < ApplicationRecord
  belongs_to :user
  has_many :items, class_name: "OrderItem", dependent: :destroy

  enum status: [:pending, :paid, :sent, :cancelled, :refunded]

  scope :pending,	 	-> { where(status: :pending) }
  scope :paid, 			-> { where(status: :paid) }
  scope :sent, 			-> { where(status: :sent) }
  scope :cancelled, -> { where(status: :cancelled) }
  scope :refunded, 	-> { where(status: :refunded) }


  scope :filter_by_status, -> (status) do
    send(status)
  end


  def count_articles
    self.items.map(&:quantity).sum
  end
end
