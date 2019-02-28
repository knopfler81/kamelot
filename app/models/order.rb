class Order < ApplicationRecord
  belongs_to :user,  optional: true
  has_many :items, class_name: "OrderItem", dependent: :destroy

  after_initialize :shipping_fees_cents

  monetize :total_cents

  enum status: [:pending, :paid, :confirmed, :shipped, :cancelled, :refunded]

  scope :pending,   -> { where(status: :pending) }
  scope :paid,      -> { where(status: :paid) }
  scope :confirmed, -> { where(status: :confirmed) }
  scope :shipped,   -> { where(status: :shipped) }
  scope :cancelled, -> { where(status: :cancelled) }
  scope :refunded,  -> { where(status: :refunded) }

  scope :filter_by_status, -> (status) do
    send(status)
  end

  def remove_from_stock
    self.with_lock do 
      self.items.each do |item|
        @variant = Variant.where(id: item.variant_id).last
        @variant.stocks.last.quantity -= item.quantity.to_i
        @variant.save
      end
    end
  end

  def count_articles
    self.items.map(&:quantity).sum
  end

  def shipping_fees_cents
    self.shipping_fees = 5
  end

  def update_sub_total!
    self.sub_total = self.items.sum('quantity * price')
    self.save
  end


  def update_total!
    self.total = self.items.sum('quantity * price') + 5
    self.save
  end

  def delivery_date_1
    order_date = Date.today 
    delivery_date_1 = order_date + 3

    if delivery_date_1.wday == 0
      delivery_date_1 += 1
    end
    delivery_date_1
  end

  def delivery_date_2
    order_date = Date.today
    delivery_date_2 = order_date + 6
    if delivery_date_2.wday == 0
      delivery_date_2 += 1
    end
    delivery_date_2
  end
end