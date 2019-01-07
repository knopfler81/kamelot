class Order < ApplicationRecord
  belongs_to :user
  has_many :items, class_name: "OrderItem", dependent: :destroy

  enum status: [:pending, :paid, :confirmed, :shipped, :cancelled, :refunded]

  scope :pending,	 	-> { where(status: :pending) }
  scope :paid, 			-> { where(status: :paid) }
  scope :confirmed, -> { where(status: :confirmed) }
  scope :shipped,   -> { where(status: :shipped) }
  scope :cancelled, -> { where(status: :cancelled) }
  scope :refunded,  -> { where(status: :refunded) }

  scope :filter_by_status, -> (status) do
    send(status)
  end


  def count_articles
    self.items.map(&:quantity).sum
  end
end
