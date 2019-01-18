class ShoppingCart

  delegate :sub_total, to: :order

  def initialize(token:)
    @token = token
  end

  def order
    @order ||= Order.find_or_create_by(token: @token, status: 0) do |order|
      order.sub_total = 0
    end
  end

  def items_count
    order.items.sum(:quantity)
  end

  def add_item(product_id:, quantity:1 , user_id:, size_id:)
    @product = Product.find(product_id)
    @size = Size.find_by(id: size_id)

    user = User.find(user_id)
    order.user_id = user.id

    @order_item =  if order.items.where(product_id: product_id).where(size_id: size_id).any?
       order.items.find_by(product_id: product_id, size_id: size_id)
    else
     order.items.new(product_id: product_id, size_id: size_id)
    end
    
    @order_item.price = @product.price_cents
    @order_item.quantity = quantity.to_i

    ActiveRecord::Base.transaction do
      @order_item.save
      update_sub_total!
    end
    CartCleanupJob.set(wait: 1.minutes).perform_later(order.id)
  end

  def change_qty(id:, quantity:1, product_id:, size_id:)
    @size = Size.find_by(id: size_id)
    @order_item = order.items.find_by(product_id: product_id, size_id: size_id)
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
