class OrderItem < ApplicationRecord
	belongs_to :order
	belongs_to :product
	belongs_to :size

	def check_if_available
		true if self.size.quantity < 1
	end
end


  def check_if_available
   @order.items.each do |item| 
      if item.size.quantity < 1
        raise "Y en a plus"
      end
    end
  end