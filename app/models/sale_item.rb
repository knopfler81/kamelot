class SaleItem < ApplicationRecord
	belongs_to :sale
	belongs_to :size
	scope :exclude_if_size_quantity_zero, ->  { joins(:size).where('sizes.quantity >?' ,0)}
end
