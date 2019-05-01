class Order < ApplicationRecord

  #require 'csv'
  require 'json'

  belongs_to :user,  optional: true
  has_many   :items, class_name: "OrderItem", dependent: :destroy
  has_one    :returning

  after_initialize :shipping_fees_cents

  monetize :total_cents

  enum status: { 
    pending: 0,
    paid: 1,
    missing_item: 2,
    confirmed: 3 ,
    full_shipped: 4,
    partly_shipped: 5,
    cancelled_by_admin: 6,
    cancelled_by_client: 7,
    partially_refunded: 8,
    totally_refunded: 9,
  }

  scope :pending,             -> { where(status: :pending) }
  scope :paid,                -> { where(status: :paid) }
  scope :confirmed,           -> { where(status: :confirmed) }
  scope :missing_item,        -> { where(status: :missing_item) }
  scope :full_shipped,        -> { where(status: :full_shipped) }
  scope :partly_shipped,      -> { where(status: :partly_shipped) }
  scope :cancelled_by_admin,  -> { where(status: :cancelled_by_admin) }
  scope :cancelled_by_client, -> { where(status: :cancelled_by_client) }
  scope :partially_refunded,  -> { where(status: :partially_refunded) }
  scope :totally_refunded,    -> { where(status: :totally_refunded) }
  scope :all_orders,          -> { Order.all }

  scope :filter_by_status, -> (status) do
    send(status).order('created_at DESC')
  end

  before_save :set_default_limit_date, on: :create
  after_save :set_return_limit_date, if: Proc.new { saved_change_to_status?(from: (1 || 2), to: 3) }
  after_save :ask_for_return,        if: Proc.new { saved_change_to_return_asked?(from: false, to: true) }
  #TODO REVOIR SUITE MODIF STATUS
  after_save :sent_articles,         if: Proc.new { saved_change_to_status?(from: 4, to: 9)}
  
  def number
     "CDE-00" + self.id.to_s
  end

  def set_default_limit_date
    self.return_limit_date = Date.today + 10.days
  end

  def cancelled_order
    OrderMailer.cancel_order(self).deliver_now
    OrderMailer.confirm_cancel_order(self).deliver_now
  end

  def ask_for_return
    if self.return_asked == true 
      returning = Returning.create(order_id: self.id, limit_date: Date.today + 10.days, status: 0, user_id: self.user_id)
      returning.save
    end
  end

  def remove_from_stock
    self.items.where(missing_quantity: 0).each do |item|
      Stock.where(variant_id: item.variant_id).where('quantity > 0').order(:created_at).reduce(item.quantity.to_i) do |quantity, stock|
        if leftover = item.quantity.to_i - stock.quantity <= 0
          stock.update_attributes! quantity: stock.quantity - item.quantity.to_i 
          break
        else
          stock.update_attributes! quantity: 0
          leftover
        end
      end
    end
  end

  def sent_articles
    if self.items.map(&:missing_quantity).sum > 0
      self.items.map do |item|
        item.quantity - item.missing_quantity
      end.sum
    else 
      self.items.map(&:quantity).sum
    end
  end

  def shipping_fees_cents
    self.shipping_fees = 5
  end

  def update_sub_total!
    if self.items.map(&:missing_quantity).sum > 0
      self.sub_total = self.items.sum('(quantity - missing_quantity) * price')
    else 
      self.sub_total = self.items.sum('quantity * price')
    end
    self.save
  end

  def update_total!
   if self.items.map(&:missing_quantity).sum > 0
     self.total = self.items.sum('(quantity - missing_quantity) * price') + 5 #shipping_fees
   else 
     self.total = self.items.sum('quantity * price') + 5 #shipping_fees
   end
   self.save
  end

  def set_total_weight
    if self.items.map(&:missing_quantity).sum > 0
      self.total_weight = self.items.sum('(quantity - missing_quantity) * weight')
    else 
      self.total_weight = self.items.sum('quantity * weight')
    end
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
  
  def set_return_limit_date  
    self.update_attributes(return_limit_date: self.updated_at + 10.days  )
  end

  def item_qty
    self.items.map(&:quantity).sum
  end

  def item_missing
    self.items.map(&:missing_quantity).sum
  end

  def all_is_missing?
    item_qty - item_missing == 0 ? true : false
  end

  def payment_id
    JSON.parse(self.payment)["id"]
  end

  # def self.to_csv
  #   CSV.generate do |csv|
  #     csv << ["Raison sociale", "*Civilité (autorisée : 'M.'ou  'Mme' )",  "*Nom",  "*Prénom", "Appartement/Chez",  "Bâtiment/Immeuble",  "*N° et libellé de voie",   "Lieu-dit/BP",  "*Code postal" , "*Ville", "*Pays", "E-mail"]
  #     Order.where(status: "confirmed").each do |o|
  #       csv << ["rs",  "M.", "#{o.user.shipping_address.first_name}", "#{o.user.shipping_address.last_name}", "", "#{o.user.shipping_address.address_1} #{o.user.shipping_address.address_2}", "LD", "#{o.user.shipping_address.zipcode}", "#{o.user.shipping_address.city}", "France", "#{o.user.email}"]  
  #     end
  #   end
  # end

end