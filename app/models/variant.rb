class Variant < ApplicationRecord
  belongs_to :product
  
  has_many :sale_items, dependent: :destroy
  has_many :order_items, dependent: :destroy
  has_many :stocks, dependent: :destroy


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
end
