class Variant < ApplicationRecord
  belongs_to :product
  
  has_many :order_items,     dependent: :destroy
  has_many :sale_items,      dependent: :destroy
  has_many :stocks,          dependent: :destroy
  has_many :returning_items, dependent: :destroy


  def size_and_color
	  if self.color == "" || self.color.nil?
	  	"#{size}"
	  else
	  	"#{size} - #{color}"	
	  end
	end

	def has_stock
		self.stocks.empty? ? false : true
	end

	def remaining_stock
		self.stocks.map(&:quantity).sum
	end


	#   def increase
	#       @size.re_add_in_stock
	#       if @size.save
	#         redirect_to admin_products_path, notice: "L'article a été remis en stock !"
	#       end
	#     end

	#     def decrease
	#       @size.remove_from_stock
	#       if @size.save
	#         redirect_to admin_products_path, notice: "Hop ! une vente de faite !"
	#       end
	#     end
	# def re_add_in_stock
	#     self.quantity += 1
	#   end

	#   def remove_from_stock
	#     self.quantity -= 1
	#   end
end
