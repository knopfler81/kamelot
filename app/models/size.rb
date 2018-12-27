class Size < ApplicationRecord
	belongs_to :product

	validates :quantity,  presence: true
	validates :size_name, presence: true
end
