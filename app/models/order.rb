class Order < ApplicationRecord
  #require 'csv'

  belongs_to :user,  optional: true
  has_many   :items, class_name: "OrderItem", dependent: :destroy

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
    self.items.each do |item|
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

  def set_total_weight
    self.total_weight =self.items.sum('quantity * weight') 
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

  def send_message(text_message)
    client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']

    client.messages.create({
      from: ENV["TWILIO_PHONE_NUMBER"],
      to:   ENV["MY_PERSONAL_PHONE_NUMBER"],  
      body: text_message
    })
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