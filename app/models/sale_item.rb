class SaleItem < ApplicationRecord
	belongs_to :sale
	belongs_to :variant
end
