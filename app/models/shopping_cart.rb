class ShoppingCart

  delegate :sub_total, to: :order

  def initialize(token:)
    @token = token
  end

  def order
    @order ||= Order.find_or_initialize_by(token: @token, status: 0) do |order|
      order.sub_total = 0
    end
  end

  def items_count
    order.items.map {|s| s.quantity }.sum
  end

  def add_item(quantity:1 , variant_id:) 
    @variant = Variant.find_by(id: variant_id)
    @stock = Stock.where(variant_id: @variant.id).last
    @product = @variant.product

    @order_item =  if order.items.where(variant_id: variant_id).any?
      order.items.find_by(variant_id: variant_id)
    else
     order.items.new(variant_id: variant_id)
    end    
    
    if !@stock.price.nil?
       @order_item.price = @stock.price
    else
      @order_item.price  = @product.price
    end

    @order_item.quantity = quantity.to_i

    ActiveRecord::Base.transaction do
      @order_item.save
      update_sub_total!
    end
    # TODO
    # remettre à 30min , est ce encore utile?? a vérifier
    if Rails.env.development?
      CartCleanupJob.set(wait: 1.minutes).perform_later(order.id) 
    else
      CartCleanupJob.set(wait: 30.minutes).perform_later(order.id) 
    end
  end

  def change_qty(id:, quantity:1, variant_id:)
    @variant = Variant.find_by(id: variant_id)
    @order_item = order.items.find_by(variant_id: variant_id)
    @order_item.quantity = quantity.to_i
    @order_item.save
    update_sub_total!
  end

  def remove_item(id:)
    ActiveRecord::Base.transaction do
      order.items.destroy(id)
      update_sub_total!
    end
  end

  private


  def update_sub_total!
    order.sub_total = order.items.sum('quantity * price')
    order.save
  end


end
