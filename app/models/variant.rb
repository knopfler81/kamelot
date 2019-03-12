class Variant < ApplicationRecord
  belongs_to :product
  
  has_many :sale_items, dependent: :destroy
  has_many :order_items, dependent: :destroy
  has_many :stocks, dependent: :destroy


  def size_and_color
	  if self.color == ""
	  	"#{size}"
	  else
	  	"#{size} - #{color}"	
	  end
	end
  
  def size_and_color_stock
    
  	if self.stocks.map(&:quantity).sum >= 1
  	  if self.color == ""
  	  	"#{size}"
  	  else
  	  	"#{size} - #{color}"	
  	  end
  	 end
	end

	def remaining_stock
		self.stocks.map(&:quantity).sum
	end
end
