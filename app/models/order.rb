class Order < ApplicationRecord
  belongs_to :user,  optional: true
  has_many :items, class_name: "OrderItem", dependent: :destroy

  after_initialize :shipping_fees_cents

  monetize :sub_total_cents
  monetize :shipping_fees_cents

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

  def remove_from_stock
    self.items.each do |item|
      @size = Size.where(id: item.size_id, product_id: item.product_id).last
      @size.quantity -= item.quantity.to_i
      @size.save
    end
  end

  def count_articles
    self.items.map(&:quantity).sum
  end

  def shipping_fees_cents
    self.shipping_fees = 500
  end

  def total_price
    (self.shipping_fees_cents + self.sub_total_cents) / 100
  end

end
