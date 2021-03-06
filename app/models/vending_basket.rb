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
    sale.items.map {|s| s.quantity }.sum
  end

  def add_item(quantity:1 , variant_id:) 
    @variant = Variant.find_by(id: variant_id)
    @stock = Stock.where(variant_id: @variant.id).last
    @product = @variant.product

    @sale_item =  if sale.items.where(variant_id: variant_id).any?
      sale.items.find_by(variant_id: variant_id)
    else
      sale.items.new(variant_id: variant_id)
    end

    if @stock.price == @product.price
      if @product.discount_percentage > 0
        @sale_item.market_price = @product.discounted_price
      else
        @sale_item.market_price = @product.market_price
      end
    else
      if @product.discount_percentage > 0
        @sale_item.market_price = @stock.discount
      else
       @sale_item.market_price = @stock.market_price
      end
    end
    @sale_item.quantity = quantity.to_i

    ActiveRecord::Base.transaction do
      @sale_item.save!
      update_sub_total!
    end
  end

  def change_qty(id:, quantity:1, variant_id:)
    @variant = Variant.find_by(id: variant_id)
    @sale_item = sale.items.find_by(variant_id: variant_id)
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
    sale.sub_total = sale.items.sum('quantity * market_price')
    sale.save
  end
end
