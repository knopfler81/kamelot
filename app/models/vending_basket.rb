class VendingBasket

  delegate :sub_total, to: :sale

  def initialize(token:)
    @token = token
  end

  def sale
    @sale ||= Sale.find_or_initialize_by(token: @token, status: 0) do |sale|
      sale.sub_total = 0
    end
  end

  def items_count
    sale.items.exclude_if_size_quantity_zero.sum(:quantity)
  end

  def add_item(quantity:1 , size_id:) 
    @size = Size.find_by(id: size_id)
    @product = @size.sizeable

    @sale_item =  if sale.items.where(size_id: size_id).any?
      sale.items.find_by(size_id: size_id)
    else
     sale.items.new(size_id: size_id)
    end
    
    @sale_item.price = @product.price
    @sale_item.quantity = quantity.to_i

    ActiveRecord::Base.transaction do
      @sale_item.save
      update_sub_total!
    end
  end

  def change_qty(id:, quantity:1, size_id:)
    @size = Size.find_by(id: size_id)
    @sale_item = sale.items.find_by(size_id: size_id)
    @sale_item.quantity = quantity.to_i
    @sale_item.save
    update_sub_total!
  end

  def remove_item(id:)
    ActiveRecord::Base.transaction do
      sale.items.destroy(id)
      update_sub_total!
    end
  end

  private

  def update_sub_total!
    sale.sub_total = sale.items.sum('quantity * price')
    sale.save
  end
end
