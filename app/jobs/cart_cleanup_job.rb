class CartCleanupJob < ApplicationJob

	queue_as :default


	def perform(order_id)
		@order = Order.find(order_id)
		
		if (@order.status == "pending" )
			@order.items.each do |item|
				re_add_stock(item.id)
				item.destroy!
			end
			update_sub_total!
			@order.destroy!
		end
	end

	private

	 def update_sub_total!
    @order.sub_total = @order.items.sum('quantity * price')
    @order.save
  end

  def re_add_stock(id)
    order_items = @order.items.find(id)

    pd = OrderItem.find(id).size_id
    @size = Size.find(pd)
    user = @order.user_id
    ActiveRecord::Base.transaction do
      @size.quantity += order_items.quantity.to_i
      @size.save
    end
  end
end

