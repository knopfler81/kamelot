class SaleItem < ApplicationRecord
	belongs_to :sale
	belongs_to :variant
	#has_many :stocks, through: :variants
	scope :exclude_if_stock_quantity_zero, -> { joins(:variant, :stock).where('stocks.quantity >?' ,0)}
end
